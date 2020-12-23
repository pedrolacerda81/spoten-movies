import 'package:flutter/material.dart';

import 'home/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spoten Movies',
      theme: ThemeData(
        primaryColor: Color(0xFF171717),
        primarySwatch: Colors.grey,
        brightness: Brightness.dark,
        fontFamily: 'Raleway',
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
