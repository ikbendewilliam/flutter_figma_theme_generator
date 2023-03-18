class GeneratedContent {
  final Map<String, String> files;
  final List<String> warnings;
  final String? themeInstanceName;

  GeneratedContent(this.files, this.warnings, [this.themeInstanceName]);

  operator +(GeneratedContent other) {
    return GeneratedContent(
      {...files, ...other.files},
      [...warnings, ...other.warnings],
      themeInstanceName ?? other.themeInstanceName,
    );
  }
}
