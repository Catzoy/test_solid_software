import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static final _random = Random();

  static Color _generateColor() {
    return Color.fromARGB(
      0xFF,
      _random.nextInt(256),
      _random.nextInt(256),
      _random.nextInt(256),
    );
  }

  Color _backgroundColor = Color(0xFFFFFFFF);

  void changeColor() => setState(
        () => _backgroundColor = _generateColor(),
      );

  @override
  Widget build(BuildContext context) {
    final shouldTextBeBlack = _backgroundColor.computeLuminance() > 0.5;
    return GestureDetector(
      onTap: changeColor,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        body: Center(
          child: Text(
            "Hey there",
            style: TextStyle(
              fontSize: 24,
              color: shouldTextBeBlack ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
