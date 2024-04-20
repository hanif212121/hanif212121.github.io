import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:core';

class _Head {
  static List kontakList = [];
}

class Decrypt {
  // (int shift) itu key nya
  static String caesarCipher(String cipherText, int shift) {
    String decrypted = caesarDecipher(cipherText, shift);
    String convertedNumber = alphaToNum(decrypted);
    print(convertedNumber);
    return convertedNumber;
  }

  static String caesarDecipher(String input, int shift) {
    // ini {shift mod 26} sesuai banyak alfabet
    shift = shift % 26;
    String output = '';
    input.runes.forEach((int rune) {
      String char = String.fromCharCode(rune);
      if (isAlpha(char)) {
        int ascii = rune;
        int shifted = (ascii - 65 - shift + 26) % 26 + 65;
        output += String.fromCharCode(shifted);
      } else {
        output += char;
      }
    });
    return output;
  }

  static String alphaToNum(String input) {
    List<String> numToAlpha = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J'
    ];
    String number = '';
    input.runes.forEach((int rune) {
      String char = String.fromCharCode(rune);
      int index = numToAlpha.indexOf(char);
      if (index != -1) {
        number += index.toString();
      }
    });
    return number;
  }

  static bool isAlpha(String char) {
    return RegExp(r'^[A-Za-z]$').hasMatch(char);
  }
}

class Kontak_v2 extends StatefulWidget {
  Kontak_v2({super.key});

  @override
  State<Kontak_v2> createState() => _Kontak_v2State();
}

class _Kontak_v2State extends State<Kontak_v2> {
  void decrypt() {
    Decrypt.caesarCipher('IJEEEE', 34242342);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Kontak 2', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: decrypt,
      ),
      body: Kontak_v2_Body(),
    );
  }
}

class Kontak_v2_Body extends StatelessWidget {
  const Kontak_v2_Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [],
          ),
          ListKontak()
        ],
      ),
    );
  }
}

class ListKontak extends StatefulWidget {
  const ListKontak({super.key});

  @override
  State<ListKontak> createState() => _ListKontakState();
}

class _ListKontakState extends State<ListKontak> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Container(
            color: Colors.blue,
            child: Text('asd'),
          ),
          Container(
            child: Text('asd'),
          ),
          Container(
            child: Text('asd'),
          )
        ],
      ),
    );
  }
}
