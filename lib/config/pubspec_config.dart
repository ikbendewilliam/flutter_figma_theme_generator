import 'package:yaml/yaml.dart';

class PubspecConfig {
  static const _defaultConfigPath = 'theme';

  late final String projectName;
  late final String configPath;
  late final String? defaultTheme;
  late final bool defaultThemeIsDarkMode;
  final fonts = <String>[];

  PubspecConfig(String pubspecContent) {
    final doc = loadYaml(pubspecContent);
    if (doc is! YamlMap) {
      throw Exception('Could not parse the pubspec.yaml');
    }
    final projectName = doc['name'];
    if (projectName == null || projectName.isEmpty) {
      throw Exception('Could not parse the pubspec.yaml, project name not found');
    }
    fonts.addAll(doc['flutter']?['fonts']?.map((e) => e['family'].toString()).toList() ?? []);

    this.projectName = projectName;
    final config = doc['flutter_figma_theme_generator'];
    configPath = config?['config_path'] ?? _defaultConfigPath;
    defaultTheme = config?['default_theme'];
    defaultThemeIsDarkMode = config?['default_theme_is_dark_mode'] == true;
  }
}
