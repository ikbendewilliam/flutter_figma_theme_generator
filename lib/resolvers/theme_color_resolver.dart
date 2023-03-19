import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorResolver {
  bool _isColor(Map<String, dynamic> data) => data['type'] == 'color' && data['value'] is String && !(data['value'] as String).startsWith('hsla(');

  bool _isThemeColor(String key, PubspecConfig pubspecConfig) => [
        pubspecConfig.defaultTheme,
        pubspecConfig.defaultLight,
        pubspecConfig.defaultDark,
      ].contains(key);

  var themeData = <String, dynamic>{};

  Map<String, String> resolve(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig, {
    String keys = '',
    Map<String, dynamic> allData = const {},
    isRoot = true,
  }) {
    final result = <String, String>{};
    final Iterable<MapEntry<String, dynamic>> entries;

    if (isRoot) {
      entries = data.entries.where((entry) => _isThemeColor(entry.key, pubspecConfig));
    } else {
      entries = data.entries;
    }
    if (_isColor(data)) {
      return {keys.camelCase: _valueFromThemeColors(data['value'], pubspecConfig.projectName.upperCamelCase)};
    }
    for (final entry in entries) {
      if (entry.value is Map<String, dynamic>) {
        if (isRoot) themeData = entry.value as Map<String, dynamic>;
        result.addAll(resolve(
          entry.value as Map<String, dynamic>,
          pubspecConfig,
          keys: isRoot ? '' : '${keys}_${entry.key}',
          allData: allData,
          isRoot: false,
        ));
      }
    }
    return result;
  }

  String _valueFromThemeColors(String data, String projectNameUpperCamelCase) {
    if (data.startsWith('rgba(')) {
      final color = data.substring(5, data.length - 1);
      final parts = color.split(',');
      final colorReference = parts[0].trim();
      final opacity = double.tryParse(parts[1].trim()) ?? 1;
      return '${projectNameUpperCamelCase}Colors.${_getFromReference(colorReference).camelCase}.withOpacity($opacity)';
    } else if (data.startsWith('{') && data.endsWith('}')) {
      return '${projectNameUpperCamelCase}Colors.${_getFromReference(data).camelCase}';
    }
    return data;
  }

  String _getFromReference(String data) {
    if (!data.startsWith('{') || !data.endsWith('}')) return data;
    final colorPaletteKeys = data.substring(1, data.length - 1).split('.');
    try {
      final value = colorPaletteKeys.fold(themeData, (value, e) => value[e]);
      final newData = value['value'] as String;
      return _getFromReference(newData);
    } catch (_) {
      return data.substring(1, data.length - 1);
    }
  }
}
