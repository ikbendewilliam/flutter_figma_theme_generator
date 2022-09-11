// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/color_generator.dart';
import 'package:flutter_figma_theme_generator/generators/current_theme_generator.dart';
import 'package:flutter_figma_theme_generator/generators/font_generator.dart';
import 'package:flutter_figma_theme_generator/generators/theme_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:path/path.dart';

Future<void> main(List<String> args) async {
  final argParser = ArgParser()
    ..addOption('path', help: 'Override the default theme folder path. This value will be used instead of the default OR what you have configured in pubspec.yaml')
    ..addFlag('help', help: 'Displays this help screen', defaultsTo: false, negatable: false);

  final results = argParser.parse(args);
  if (results['help']) {
    print(argParser.usage);
    return;
  }

  final pubspecYaml = File(join(Directory.current.path, 'pubspec.yaml'));
  if (!pubspecYaml.existsSync()) {
    throw Exception('This program should be run from the root of a flutter/dart project');
  }
  final pubspecContent = pubspecYaml.readAsStringSync();
  final pubspecConfig = PubspecConfig(pubspecContent);

  final configPath = results['path'] ?? pubspecConfig.configPath;
  Directory configFolder;
  if (isAbsolute(configPath)) {
    configFolder = Directory(configPath);
  } else {
    configFolder = Directory(join(Directory.current.path, configPath));
  }

  if (!configFolder.existsSync()) {
    throw Exception('This program requires a config folder. Configuration is set to `$configPath`');
  }
  final themeFiles = configFolder.listSync(recursive: true).whereType<File>().where((e) => e.path.endsWith('.json'));
  final fontGenerator = FontGenerator();
  final nonThemeGenerators = [fontGenerator, ColorGenerator()];
  final contents = await _readFiles(themeFiles);
  var defaultTheme = pubspecConfig.defaultTheme ??
      contents.entries.firstWhere((element) => nonThemeGenerators.any((e) => e.matchesSchema(element.value)), orElse: () => throw Exception('Could not find any theme')).key;
  final hasFontTheme = contents.values.any(fontGenerator.matchesSchema);
  final generatedContents = <GeneratedContent>[];
  final warnings = <String>[];
  if (!contents.containsKey(defaultTheme)) {
    warnings.add('Could not find the default theme `$defaultTheme` in the theme folder. Defaulting to the first theme found. Found: ${contents.keys.join(', ')}');
    defaultTheme = contents.entries.first.key;
  }

  generatedContents.add(await _processThemeFile(contents[defaultTheme]!, defaultTheme, pubspecConfig));
  generatedContents.addAll(await Future.wait(contents.entries.where((element) => element.key != defaultTheme).map((e) => _processThemeFile(e.value, e.key, pubspecConfig))));
  final generatedInstances = generatedContents.map((e) => e.themeInstanceName).whereType<String>();
  generatedContents.add(await _generateThemeFile(generatedInstances, pubspecConfig, hasFontTheme));

  final allWarnings = generatedContents.expand((e) => e.warnings).toSet();
  allWarnings.addAll(warnings);
  if (allWarnings.isNotEmpty) {
    print('Completed with warnings:');
    for (final warning in allWarnings) {
      print(' $warning');
    }
  } else {
    print('Completed without warnings!');
  }
}

Future<GeneratedContent> _generateThemeFile(Iterable<String> generatedInstances, PubspecConfig pubspecConfig, bool hasFontTheme) async {
  final generatedTheme = CurrentThemeGenerator.generateTheme(generatedInstances, pubspecConfig, hasFontTheme);
  await _createFile(generatedTheme);
  return generatedTheme;
}

Future<void> _createFile(GeneratedContent generatedTheme) async {
  final themeDirectory = Directory(join('lib', 'styles'));
  if (!themeDirectory.existsSync()) {
    themeDirectory.createSync(recursive: true);
  }

  await Future.wait(generatedTheme.files.entries.map((fileEntry) async {
    final file = File(join('lib', 'styles', '${fileEntry.key}.dart'));
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    await file.writeAsString(fileEntry.value);
    print('created file ${file.path}');
  }));
}

Future<Map<String, Map<String, dynamic>>> _readFiles(Iterable<File> themeFiles) async {
  final contents = <String, Map<String, dynamic>>{};
  await Future.wait(themeFiles.map((file) async => contents[file.path.substring(file.path.lastIndexOf('/') + 1)] = jsonDecode(await file.readAsString())));
  return contents;
}

Future<GeneratedContent> _processThemeFile(Map<String, dynamic> content, String path, PubspecConfig pubspecConfig) async {
  final generatedTheme = ThemeGenerator.generateTheme(content, path, pubspecConfig);
  await _createFile(generatedTheme);
  return generatedTheme;
}
