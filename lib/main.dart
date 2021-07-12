import 'package:flutter/material.dart';
import 'package:amiibo_api/src/pages/home_page.dart';
import 'package:amiibo_api/src/pages/character_details.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voiceless Character Viewer',
      initialRoute: '/',
      routes: {'/': (_) => HomePage(), '/detalle': (_) => Details()},
    );
  }
}
