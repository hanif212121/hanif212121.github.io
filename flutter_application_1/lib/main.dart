import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:flutter_application_1/pages/kontak.dart';
import 'package:flutter_application_1/pages/kontak_v2.dart';
import 'package:flutter_application_1/pages/inputFile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void f() {
    int x = 1;
    debugPrint('debug: $x');
  }

  @override
  Widget build(BuildContext context) {
    f();

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
        '/kontak_v2': (context) => Kontak_v2(),
        '/inputFile': (context) => InputFile(),
      },
    );
  }
}
