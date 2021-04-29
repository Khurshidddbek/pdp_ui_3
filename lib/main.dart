import 'package:flutter/material.dart';
import 'package:pdp_ui_3/pages/home_page.dart';
import 'package:pdp_ui_3/pages/intro_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntroPage(),
      routes: {
        Homepage.id: (context) => Homepage(),
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}
