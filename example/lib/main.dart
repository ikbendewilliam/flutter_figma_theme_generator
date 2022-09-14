import 'package:example/styles/example_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Figma Theme Generator Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ExampleTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Figma Theme Generator Demo'),
        backgroundColor: theme.colors.uIActionBg,
      ),
      backgroundColor: theme.colors.uIBgScreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: theme.textStyles.titleMedium.copyWith(color: theme.colors.uIContentTextDefault),
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: theme.textStyles.titleExtraLarge.copyWith(color: theme.colors.uIContentTextSubtle),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                setState(() {
                  ExampleTheme.userPrefferedThemeType = ThemeType.exampleColorsThemeRedModeType;
                });
              },
              color: ExampleTheme.of(context, forceRedMode: true).colors.uIBgScreen,
              child: Text(
                'Set Red Mode',
                style: theme.textStyles.textRegularMedium.copyWith(color: ExampleTheme.of(context, forceRedMode: true).colors.uIContentTextDefault),
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                setState(() {
                  ExampleTheme.userPrefferedThemeType = ThemeType.exampleColorsThemeLightModeType;
                });
              },
              color: ExampleTheme.of(context, forceLightMode: true).colors.uIBgScreen,
              child: Text(
                'Set Light Mode',
                style: theme.textStyles.textRegularMedium.copyWith(color: ExampleTheme.of(context, forceLightMode: true).colors.uIContentTextDefault),
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                setState(() {
                  ExampleTheme.userPrefferedThemeType = ThemeType.exampleColorsThemeDefaultType;
                });
              },
              color: ExampleTheme.of(context, forceDefault: true).colors.uIBgScreen,
              child: Text(
                'Set Default Mode',
                style: theme.textStyles.textRegularMedium.copyWith(color: ExampleTheme.of(context, forceDefault: true).colors.uIContentTextDefault),
              ),
            ),
            const SizedBox(height: 32),
            MaterialButton(
              onPressed: () {
                setState(() {
                  ExampleTheme.userPrefferedThemeType = null;
                });
              },
              child: const Text('Set System Mode'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: theme.colors.uIActionBg,
        child: Icon(
          Icons.add,
          color: theme.colors.uIContentTextDefault,
        ),
      ),
    );
  }
}
