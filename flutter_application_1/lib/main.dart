import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/kontak.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Color.fromARGB(255, 17, 165, 218),
        useMaterial3: true,
      ),
      title: 'asdasd',
      home: Home(),
      routes: {
        '/home': (context) => Home(),
        '/kontak': (context) => Kontak(),
      },
    );
  }
}
