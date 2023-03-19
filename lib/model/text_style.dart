class TextStyle {
  const TextStyle({
    this.inherit = true,
    this.color,
    this.backgroundColor,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.textBaseline,
    this.height,
    this.fontFamily,
    this.shadows,
    this.overflow,
    this.fontFeatures,
    this.fontVariations,
    this.decoration,
    this.decorationColor,
    this.decorationStyle,
    this.decorationThickness,
    this.debugLabel,
  });

  /// Whether null values are replaced with their value in an ancestor text
  /// style (e.g., in a [TextSpan] tree).
  ///
  /// If this is false, properties that don't have explicit values will revert
  /// to the defaults: white in color, a font size of 14 pixels, in a sans-serif
  /// font face.
  final bool inherit;

  /// The color to use when painting the text.
  ///
  /// If [foreground] is specified, this value must be null. The [color] property
  /// is shorthand for `Paint()..color = color`.
  ///
  /// In [merge], [apply], and [lerp], conflicts between [color] and [foreground]
  /// specification are resolved in [foreground]'s favor - i.e. if [foreground] is
  /// specified in one place, it will dominate [color] in another.
  final String? color;

  /// The color to use as the background for the text.
  ///
  /// If [background] is specified, this value must be null. The
  /// [backgroundColor] property is shorthand for
  /// `background: Paint()..color = backgroundColor`.
  ///
  /// In [merge], [apply], and [lerp], conflicts between [backgroundColor] and [background]
  /// specification are resolved in [background]'s favor - i.e. if [background] is
  /// specified in one place, it will dominate [color] in another.
  final String? backgroundColor;

  /// The name of the font to use when painting the text (e.g., Roboto).
  ///
  /// If the font is defined in a package, this will be prefixed with
  /// 'packages/package_name/' (e.g. 'packages/cool_fonts/Roboto'). The
  /// prefixing is done by the constructor when the `package` argument is
  /// provided.
  ///
  /// The value provided in [fontFamily] will act as the preferred/first font
  /// family that glyphs are looked for in, followed in order by the font families
  /// in [fontFamilyFallback]. When [fontFamily] is null or not provided, the
  /// first value in [fontFamilyFallback] acts as the preferred/first font
  /// family. When neither is provided, then the default platform font will
  /// be used.
  final String? fontFamily;

  /// The size of glyphs (in logical pixels) to use when painting the text.
  ///
  /// During painting, the [fontSize] is multiplied by the current
  /// `textScaleFactor` to let users make it easier to read text by increasing
  /// its size.
  ///
  /// [getParagraphStyle] will default to 14 logical pixels if the font size
  /// isn't specified here.
  final double? fontSize;

  /// The typeface thickness to use when painting the text (e.g., bold).
  final String? fontWeight;

  /// The typeface variant to use when drawing the letters (e.g., italics).
  final String? fontStyle;

  /// The amount of space (in logical pixels) to add between each letter.
  /// A negative value can be used to bring the letters closer.
  final double? letterSpacing;

  /// The amount of space (in logical pixels) to add at each sequence of
  /// white-space (i.e. between each word). A negative value can be used to
  /// bring the words closer.
  final double? wordSpacing;

  /// The common baseline that should be aligned between this text span and its
  /// parent text span, or, for the root text spans, with the line box.
  final String? textBaseline;

  /// The height of this text span, as a multiple of the font size.
  ///
  /// When [height] is null or omitted, the line height will be determined
  /// by the font's metrics directly, which may differ from the fontSize.
  /// When [height] is non-null, the line height of the span of text will be a
  /// multiple of [fontSize] and be exactly `fontSize * height` logical pixels
  /// tall.
  ///
  /// For most fonts, setting [height] to 1.0 is not the same as omitting or
  /// setting height to null because the [fontSize] sets the height of the EM-square,
  /// which is different than the font provided metrics for line height. The
  /// following diagram illustrates the difference between the font-metrics
  /// defined line height and the line height produced with `height: 1.0`
  /// (which forms the upper and lower edges of the EM-square):
  ///
  /// ![With the font-metrics-defined line height, there is space between lines appropriate for the font, whereas the EM-square is only the height required to hold most of the characters.](https://flutter.github.io/assets-for-api-docs/assets/painting/text_height_diagram.png)
  ///
  /// Examples of the resulting line heights from different values of `TextStyle.height`:
  ///
  /// ![Since the explicit line height is applied as a scale factor on the font-metrics-defined line height, the gap above the text grows faster, as the height grows, than the gap below the text.](https://flutter.github.io/assets-for-api-docs/assets/painting/text_height_comparison_diagram.png)
  ///
  /// See [StrutStyle] and [TextHeightBehavior] for further control of line
  /// height at the paragraph level.
  final double? height;

  /// The decorations to paint near the text (e.g., an underline).
  ///
  /// Multiple decorations can be applied using [TextDecoration.combine].
  final String? decoration;

  /// The color in which to paint the text decorations.
  final String? decorationColor;

  /// The style in which to paint the text decorations (e.g., dashed).
  final String? decorationStyle;

  /// The thickness of the decoration stroke as a multiplier of the thickness
  /// defined by the font.
  ///
  /// The font provides a base stroke width for [decoration]s which scales off
  /// of the [fontSize]. This property may be used to achieve a thinner or
  /// thicker decoration stroke, without changing the [fontSize]. For example,
  /// a [decorationThickness] of 2.0 will draw a decoration twice as thick as
  /// the font defined decoration thickness.
  ///
  /// {@tool snippet}
  /// To achieve a bolded strike-through, we can apply a thicker stroke for the
  /// decoration.
  ///
  /// ```dart
  /// const Text(
  ///   'This has a very BOLD strike through!',
  ///   style: TextStyle(
  ///     decoration: TextDecoration.lineThrough,
  ///     decorationThickness: 2.85,
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// {@tool snippet}
  /// We can apply a very thin and subtle wavy underline (perhaps, when words
  /// are misspelled) by using a [decorationThickness] < 1.0.
  ///
  /// ```dart
  /// const Text(
  ///   'oopsIforgottousespaces!',
  ///   style: TextStyle(
  ///     decoration: TextDecoration.underline,
  ///     decorationStyle: TextDecorationStyle.wavy,
  ///     decorationColor: Colors.red,
  ///     decorationThickness: 0.5,
  ///   ),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// The default [decorationThickness] is 1.0, which will use the font's base
  /// stroke thickness/width.
  final double? decorationThickness;

  /// A human-readable description of this text style.
  ///
  /// This property is maintained only in debug builds.
  ///
  /// When merging ([merge]), copying ([copyWith]), modifying using [apply], or
  /// interpolating ([lerp]), the label of the resulting style is marked with
  /// the debug labels of the original styles. This helps figuring out where a
  /// particular text style came from.
  ///
  /// This property is not considered when comparing text styles using `==` or
  /// [compareTo], and it does not affect [hashCode].
  final String? debugLabel;

  /// A list of [Shadow]s that will be painted underneath the text.
  ///
  /// Multiple shadows are supported to replicate lighting from multiple light
  /// sources.
  ///
  /// Shadows must be in the same order for [TextStyle] to be considered as
  /// equivalent as order produces differing transparency.
  final List<String>? shadows;

  /// A list of [FontFeature]s that affect how the font selects glyphs.
  ///
  /// Some fonts support multiple variants of how a given character can be
  /// rendered.  For example, a font might provide both proportional and
  /// tabular numbers, or it might offer versions of the zero digit with
  /// and without slashes.  [FontFeature]s can be used to select which of
  /// these variants will be used for rendering.
  final List<String>? fontFeatures;

  /// A list of [FontVariation]s that affect how a variable font is rendered.
  ///
  /// Some fonts are variable fonts that can generate multiple font faces based
  /// on the values of customizable attributes.  For example, a variable font
  /// may have a weight axis that can be set to a value between 1 and 1000.
  /// [FontVariation]s can be used to select the values of these design axes.
  ///
  /// For example, to control the weight axis of the Roboto Slab variable font
  /// (https://fonts.google.com/specimen/Roboto+Slab):
  /// ```dart
  /// TextStyle(
  ///   fontFamily: 'RobotoSlab',
  ///   fontVariations: <FontVariation>[FontVariation('wght', 900.0)]
  /// )
  /// ```
  final List<String>? fontVariations;

  /// How visual text overflow should be handled.
  final String? overflow;

  Map<String, dynamic> toJson() => {
        'inherit': inherit,
        'color': color,
        'backgroundColor': backgroundColor,
        'fontFamily': fontFamily,
        'fontSize': fontSize,
        'fontWeight': fontWeight,
        'fontStyle': fontStyle,
        'letterSpacing': letterSpacing,
        'wordSpacing': wordSpacing,
        'textBaseline': textBaseline,
        'height': height,
        'decoration': decoration,
        'decorationColor': decorationColor,
        'decorationStyle': decorationStyle,
        'decorationThickness': decorationThickness,
        'debugLabel': debugLabel,
        'shadows': shadows,
        'fontFeatures': fontFeatures,
        'fontVariations': fontVariations,
        'overflow': overflow,
      };

  static TextStyle fromJson(Map<String, dynamic> json) => TextStyle(
        inherit: json['inherit'] as bool? ?? true,
        color: json['color'] as String?,
        backgroundColor: json['backgroundColor'] as String?,
        fontFamily: json['fontFamily'] as String?,
        fontSize: json['fontSize'] as double?,
        fontWeight: json['fontWeight'] as String?,
        fontStyle: json['fontStyle'] as String?,
        letterSpacing: json['letterSpacing'] as double?,
        wordSpacing: json['wordSpacing'] as double?,
        textBaseline: json['textBaseline'] as String?,
        height: json['height'] as double?,
        decoration: json['decoration'] as String?,
        decorationColor: json['decorationColor'] as String?,
        decorationStyle: json['decorationStyle'] as String?,
        decorationThickness: json['decorationThickness'] as double?,
        debugLabel: json['debugLabel'] as String?,
        shadows: json['shadows'] as List<String>?,
        fontFeatures: json['fontFeatures'] as List<String>?,
        fontVariations: json['fontVariations'] as List<String>?,
        overflow: json['overflow'] as String?,
      );

  @override
  String toString() {
    return 'TextStyle(inherit: $inherit, color: $color, backgroundColor: $backgroundColor, fontFamily: ${fontFamily is String ? '"$fontFamily"' : fontFamily}, fontSize: $fontSize, fontWeight: $fontWeight, fontStyle: $fontStyle, letterSpacing: $letterSpacing, wordSpacing: $wordSpacing, textBaseline: $textBaseline, height: $height, decoration: $decoration, decorationColor: $decorationColor, decorationStyle: $decorationStyle, decorationThickness: $decorationThickness, debugLabel: $debugLabel, shadows: $shadows, fontFeatures: $fontFeatures, fontVariations: $fontVariations, overflow: $overflow)';
  }

  String stringWithOverrides(String overrideName) {
    return '''TextStyle(
      inherit: $overrideName?.inherit ?? allOverrides?.inherit ?? $inherit,
      color: $overrideName?.color ?? allOverrides?.color${color == null ? '' : ' ?? $color'},
      backgroundColor: $overrideName?.backgroundColor ?? allOverrides?.backgroundColor${backgroundColor == null ? '' : ' ?? $backgroundColor'},
      fontFamily: $overrideName?.fontFamily ?? allOverrides?.fontFamily${fontFamily == null ? '' : ' ?? ${fontFamily is String ? '"$fontFamily"' : fontFamily}'},
      fontSize: $overrideName?.fontSize ?? allOverrides?.fontSize${fontSize == null ? '' : ' ?? $fontSize'},
      fontWeight: $overrideName?.fontWeight ?? allOverrides?.fontWeight${fontWeight == null ? '' : ' ?? $fontWeight'},
      fontStyle: $overrideName?.fontStyle ?? allOverrides?.fontStyle${fontStyle == null ? '' : ' ?? $fontStyle'},
      letterSpacing: $overrideName?.letterSpacing ?? allOverrides?.letterSpacing${letterSpacing == null ? '' : ' ?? $letterSpacing'},
      wordSpacing: $overrideName?.wordSpacing ?? allOverrides?.wordSpacing${wordSpacing == null ? '' : ' ?? $wordSpacing'},
      textBaseline: $overrideName?.textBaseline ?? allOverrides?.textBaseline${textBaseline == null ? '' : ' ?? $textBaseline'},
      height: $overrideName?.height ?? allOverrides?.height${height == null ? '' : ' ?? $height'},
      decoration: $overrideName?.decoration ?? allOverrides?.decoration${decoration == null ? '' : ' ?? $decoration'},
      decorationColor: $overrideName?.decorationColor ?? allOverrides?.decorationColor${decorationColor == null ? '' : ' ?? $decorationColor'},
      decorationStyle: $overrideName?.decorationStyle ?? allOverrides?.decorationStyle${decorationStyle == null ? '' : ' ?? $decorationStyle'},
      decorationThickness: $overrideName?.decorationThickness ?? allOverrides?.decorationThickness${decorationThickness == null ? '' : ' ?? $decorationThickness'},
      debugLabel: $overrideName?.debugLabel ?? allOverrides?.debugLabel${debugLabel == null ? '' : ' ?? $debugLabel'},
      shadows: $overrideName?.shadows ?? allOverrides?.shadows${shadows == null ? '' : ' ?? $shadows'},
      fontFeatures: $overrideName?.fontFeatures ?? allOverrides?.fontFeatures${fontFeatures == null ? '' : ' ?? $fontFeatures'},
      fontVariations: $overrideName?.fontVariations ?? allOverrides?.fontVariations${fontVariations == null ? '' : ' ?? $fontVariations'},
      overflow: $overrideName?.overflow ?? allOverrides?.overflow${overflow == null ? '' : ' ?? $overflow'},
    )''';
  }
}
