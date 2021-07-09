import 'package:flutter/material.dart';
import './landing_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.dark,
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          /* dark theme settings */
        ),
        // theme: new ThemeData(

        //   primarySwatch: Colors.teal,
        //   canvasColor: Colors.transparent,
        // ),
        title: 'Flutter Demo',
        home: LandingScreen());
  }
}
