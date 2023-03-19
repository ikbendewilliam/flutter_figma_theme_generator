class GeneratedContent {
  final Map<String, String> files;
  final List<String> warnings;
  final List<String> themeInstanceNames;

  GeneratedContent(this.files, this.warnings, [this.themeInstanceNames = const []]);

  operator +(GeneratedContent other) {
    return GeneratedContent(
      {...files, ...other.files},
      [...warnings, ...other.warnings],
      [...themeInstanceNames, ...other.themeInstanceNames],
    );
  }
}
