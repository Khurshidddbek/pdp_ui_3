import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  static final String id = 'home_page';

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
