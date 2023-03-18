import 'dart:math';

import 'package:flutter_figma_theme_generator/utils/case_utils.dart';

class ThemeColorResolver {
  bool _isColor(Map<String, dynamic> data) => data['type'] == 'color' && data['value'] is String && !(data['value'] as String).startsWith('hsla(');

  Map<String, String> resolve(Map<String, dynamic> data, String keys, Map<String, dynamic> allData) {
    if (_isColor(data)) {
      return {keys.camelCase: _resolveColor(data['value'], allData)};
    }
    final result = <String, String>{};
    for (final entry in data.entries) {
      if (entry.value is Map<String, dynamic>) {
        result.addAll(resolve(entry.value as Map<String, dynamic>, '${keys}_${entry.key}', allData));
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
