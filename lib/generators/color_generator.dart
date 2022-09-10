import 'dart:math';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/generators/theme_generator.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ColorGenerator extends BaseGenerator {
  final _warnings = <String>[];

  @override
  bool matchesSchema(Map<String, dynamic> schema) => schema['Colour palette'] != null;

  @override
  GeneratedContent generate(Map<String, dynamic> schema, PubspecConfig pubspecConfig) {
    _warnings.clear();
    final colorPalette = schema['Colour palette'] as Map<String, dynamic>;
    final colors = <String, String>{};
    final files = <String, String>{};

    for (final entry in colorPalette.entries) {
      final json = entry.value as Map<String, dynamic>;
      colors.addAll(_generateColors(entry.key, json, colorPalette));
    }

    var colorFile = '''import 'package:flutter/material.dart';\n\n''';
    colorFile += 'class ${pubspecConfig.projectName.upperCamelCase}Colors {\n';
    colorFile += colors.entries.map((color) => '  static const ${color.key} = Color(${color.value});\n').join();
    colorFile += '}\n';

    files['${pubspecConfig.projectName.snakeCase}_colors'] = colorFile;

    return GeneratedContent(files, _warnings);
  }

  String _generateColor(String data, Map<String, dynamic> colorPalette) {
    if (data.startsWith('hsla(')) {
      final hsla = data.substring(5, data.length - 1).split(',').map((e) => e.trim()).toList();
      return hslToHex(
        _valueOrFromColorPalette(hsla[0], colorPalette),
        _valueOrFromColorPalette(hsla[1], colorPalette),
        _valueOrFromColorPalette(hsla[2], colorPalette),
        _valueOrFromColorPalette(hsla[3], colorPalette),
      );
    }
    _warnings.add(
        'Color $data is not in HSLA format, for now only HSLA is supported, create an issue on GitHub https://github.com/ikbendewilliam/flutter_figma_theme_generator if you need other formats.');
    return '0xFF000000';
  }

  Map<String, String> _generateColors(String key, Map<String, dynamic> data, Map<String, dynamic> colorPalette) {
    final colors = <String, String>{};
    for (final entry in data.entries) {
      if (entry.key == 'value' && entry.value is String && _isColor(data)) {
        colors[key.camelCase] = _generateColor(entry.value, colorPalette);
      } else if (!_isColorConfig(entry.key) && entry.value is Map<String, dynamic>) {
        colors.addAll(_generateColors('${key}_${entry.key}'.camelCase, entry.value as Map<String, dynamic>, colorPalette));
      }
    }
    return colors;
  }

  double _valueOrFromColorPalette(String data, Map<String, dynamic> colorPalette) {
    String? amount;
    if (data.startsWith('{') && data.endsWith('}')) {
      final colorPaletteKeys = data.substring(1, data.length - 1).split('.');
      final value = colorPaletteKeys.fold(colorPalette, (value, e) => value[e]);
      amount = value['value'] as String?;
    }
    amount ??= data;
    if (amount.endsWith('%')) {
      return double.parse(amount.substring(0, amount.length - 1));
    }
    return double.parse(amount);
  }

  String hslToHex(double hue, double saturation, double light, double opacity) {
    light /= 100;
    final a = saturation * min(light, 1 - light) / 100;
    final red = calucalateHex(0, hue, saturation, light, a);
    final green = calucalateHex(8, hue, saturation, light, a);
    final blue = calucalateHex(4, hue, saturation, light, a);
    final alpha = (255 * opacity).round().toRadixString(16).padLeft(2, '0');
    return '0x${'$alpha$red$green$blue'.toUpperCase()}';
  }

  String calucalateHex(int n, double hue, double saturation, double light, double a) {
    final k = (n + hue / 30) % 12;
    final color = light - a * max(min(k - 3, min(9 - k, 1)), -1);
    return (255 * color).round().toRadixString(16).padLeft(2, '0'); // convert to Hex and prefix "0" if needed
  }

  bool _isColorConfig(dynamic data) => data is Map<String, dynamic> && data['type'] == 'Color-config';

  bool _isColor(dynamic data) => data is Map<String, dynamic> && data['type'] == 'color';
}
