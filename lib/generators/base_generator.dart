import 'package:flutter_figma_theme_generator/config/pubspec_config.dart';
import 'package:flutter_figma_theme_generator/model/generated_content.dart';

abstract class BaseGenerator {
  GeneratedContent generate(Map<String, dynamic> data, PubspecConfig pubspecConfig);
}
