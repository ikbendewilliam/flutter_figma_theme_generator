// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/utils/theme_generator.dart';
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
  final warnings = await Future.wait(themeFiles.map((e) => _processThemeFile(e, pubspecConfig)));
  final allWarnings = warnings.expand((e) => e).toSet();
  if (allWarnings.isNotEmpty) {
    print('Completed with warnings:');
    for (final warning in allWarnings) {
      print(' $warning');
    }
  } else {
    print('Completed without warnings!');
  }
}

Future<List<String>> _processThemeFile(File themeFile, PubspecConfig pubspecConfig) async {
  final themeJson = await themeFile.readAsString();
  final generatedTheme = ThemeGenerator.generateTheme(themeJson, themeFile.path, pubspecConfig);

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
  return generatedTheme.warnings;
}
