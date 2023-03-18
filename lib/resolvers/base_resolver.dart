import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';

abstract class BaseResolver<T> {
  Map<String, T> resolve(Map<String, dynamic> data, PubspecConfig pubspecConfig);
}
