class CurrentThemeGenerator {}

// static AmpereTheme of(BuildContext context, {bool forceDark = false, bool forceLight = false}) {
//   if (forceDark) return _instanceDark;
//   if (forceLight) return _instanceLight;

//   final theme = FlavorConfig.instance.themeMode;
//   if (theme == ThemeMode.dark) {
//     return _instanceDark;
//   } else if (theme == ThemeMode.light) {
//     return _instanceLight;
//   }
//   final brightness = MediaQuery.of(context).platformBrightness;

//   if (brightness == Brightness.dark) return _instanceDark;

//   return _instanceLight;
// }
