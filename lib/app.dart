import 'package:flutter/material.dart';
import 'package:shopping_list/pages/home.page.dart';

// Main app that handles all the routes and pages
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
