import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorResolver extends BaseResolver {
  bool _isColor(Map<String, dynamic> data) => data['type'] == 'color' && data['value'] is String && !(data['value'] as String).startsWith('hsla(');

  bool _isThemeColor(String key, PubspecConfig pubspecConfig) => ![
        pubspecConfig.colourPaletteKey,
        pubspecConfig.typographyKey,
      ].contains(key);

  var themeData = <String, dynamic>{};

  @override
  Map<String, Map<String, String>> resolve(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig, {
    String keys = '',
    Map<String, dynamic> allData = const {},
  }) {
    final result = <String, Map<String, String>>{};
    for (final entry in data.entries.where((entry) => _isThemeColor(entry.key, pubspecConfig))) {
      if (entry.value is Map<String, dynamic>) {
        themeData = entry.value as Map<String, dynamic>;
        result.addAll(
          {
            entry.key.camelCase: _resolveEntry(
              entry.value as Map<String, dynamic>,
              pubspecConfig,
              allData: allData,
            )
          },
        );
      }
    }
    return result..removeWhere((key, value) => value.isEmpty);
  }

  Map<String, String> _resolveEntry(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig, {
    String keys = '',
    Map<String, dynamic> allData = const {},
  }) {
    final result = <String, String>{};
    if (_isColor(data)) {
      return {keys.camelCase: _valueFromThemeColors(data['value'], pubspecConfig.projectName.upperCamelCase)};
    }
    for (final entry in data.entries) {
      if (entry.value is Map<String, dynamic>) {
        result.addAll(_resolveEntry(
          entry.value as Map<String, dynamic>,
          pubspecConfig,
          keys: '${keys}_${entry.key}',
          allData: allData,
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
