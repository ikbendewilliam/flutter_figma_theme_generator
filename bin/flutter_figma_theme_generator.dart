// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/flutter_figma_theme_generator.dart';
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
    throw Exception('The Figma theme generator requires a config folder to exist. Configuration is set to `$configPath`');
  }
  final themeFiles = configFolder.listSync(recursive: true).whereType<File>().where((e) => e.path.endsWith('.json'));
  final contents = await _readFiles(themeFiles);
  var defaultTheme = pubspecConfig.defaultTheme ?? '';
  final warnings = <String>[];
  if (!contents.containsKey(defaultTheme)) {
    warnings.add('Could not find the default theme `$defaultTheme` in the theme folder. Defaulting to the first theme found. Found: ${contents.keys.join(', ')}');
    defaultTheme = contents.entries.first.key;
    // TODO: Find default theme
  }
  final generatedContents = await FlutterFigmaThemeGenerator.processFiles(pubspecConfig, contents, defaultTheme);

  await Future.wait(generatedContents.map(_createFiles));

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

Future<Map<String, Map<String, dynamic>>> _readFiles(Iterable<File> themeFiles) async {
  final contents = <String, Map<String, dynamic>>{};
  await Future.wait(themeFiles.map((file) async => contents[file.path.substring(file.path.lastIndexOf('/') + 1)] = jsonDecode(await file.readAsString())));
  return contents;
}

Future<void> _createFiles(GeneratedContent generatedTheme) async {
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
