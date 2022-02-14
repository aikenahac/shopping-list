import 'package:flutter/material.dart';
import 'package:shopping_list/pages/home.page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (_) => const HomePage(),
          },
          theme: ThemeData(primarySwatch: Colors.blue),
          darkTheme: ThemeData.dark(),
        );
      },
    );
  }
}
