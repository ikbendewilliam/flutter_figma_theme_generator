import 'dart:math';

import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/resolvers/base_resolver.dart';
import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ColorResolver extends BaseResolver<String> {
  bool _isColor(Map<String, dynamic> data) => data['type'] == 'color' && data['value'] is String && (data['value'] as String).startsWith(RegExp('#|hsla'));

  @override
  Map<String, String> resolve(
    Map<String, dynamic> data,
    PubspecConfig pubspecConfig, {
    String keys = '',
    Map<String, dynamic> allData = const {},
  }) {
    if (allData.isEmpty) {
      allData = data;
      if (pubspecConfig.colourPaletteKey?.isNotEmpty == true) {
        if (!allData.containsKey(pubspecConfig.colourPaletteKey!)) {
          throw Exception('Colour palette key not found in tokens, ${pubspecConfig.colourPaletteKey} not in ${allData.keys}');
        }
        allData = allData[pubspecConfig.colourPaletteKey!] as Map<String, dynamic>;
      }
    }
    if (_isColor(data)) {
      return {keys.camelCase: _resolveColor(data['value'], allData)};
    }
    final result = <String, String>{};
    for (final entry in data.entries) {
      if (entry.value is Map<String, dynamic>) {
        var newKeys = keys.isEmpty ? entry.key : '${keys}_${entry.key}';
        if (newKeys == pubspecConfig.colourPaletteKey) {
          newKeys = '';
        }
        result.addAll(resolve(
          entry.value as Map<String, dynamic>,
          pubspecConfig,
          keys: newKeys,
          allData: allData,
        ));
      }
    }
    return result;
  }

  double _valueOrFromColorPalette(String data, Map<String, dynamic> colorPalette) {
    String? amount;
    if (data.startsWith('{') && data.endsWith('}')) {
      final colorPaletteKeys = data.substring(1, data.length - 1).split('.');
      final value = colorPaletteKeys.fold(colorPalette, (value, e) => value[e]);
      amount = value['value'] as String?;
      if (amount != null && amount.startsWith('{') && amount.endsWith('}')) {
        return _valueOrFromColorPalette(amount, colorPalette);
      }
    }
    amount ??= data;
    if (amount.endsWith('%')) {
      return double.parse(amount.substring(0, amount.length - 1));
    }
    return double.parse(amount);
  }

  String _resolveColor(String data, Map<String, dynamic> colorPalette) {
    if (data.startsWith('#')) {
      return '0xFF${data.substring(1).toUpperCase()}';
    }
    if (!data.startsWith('hsla')) {
      throw Exception('Unknown color format: $data');
    }
    final hsla = data.substring(5, data.length - 1).split(',').map((e) => e.trim()).toList();
    return hslToHex(
      _valueOrFromColorPalette(hsla[0], colorPalette),
      _valueOrFromColorPalette(hsla[1], colorPalette),
      _valueOrFromColorPalette(hsla[2], colorPalette),
      _valueOrFromColorPalette(hsla[3], colorPalette),
    );
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
}
