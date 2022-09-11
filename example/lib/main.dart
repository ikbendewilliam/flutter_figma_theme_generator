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
        backgroundColor: theme.colors.uIBgSurface1,
      ),
      backgroundColor: theme.colors.uIBgCanvas,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You have pushed the button this many times:',
              style: theme.fonts.titleMedium.copyWith(color: theme.colors.uIContentTextDefault),
              textAlign: TextAlign.center,
            ),
            Text(
              '$_counter',
              style: theme.fonts.titleExtraLarge.copyWith(color: theme.colors.uIContentTextSelected),
            ),
            const SizedBox(height: 32),
            Text(
              'Change the OS theme to see the theme change',
              style: theme.fonts.titleMedium.copyWith(color: theme.colors.uIContentTextDefault),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        backgroundColor: theme.colors.uIActionDanger,
        child: const Icon(Icons.add),
      ),
    );
  }
}
