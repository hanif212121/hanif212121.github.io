import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Kontak extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text('Kontakku')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      content: Container(
                        width: double.maxFinite,
                        padding: EdgeInsets.only(
                            top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
                        child: TextField(
                          style: TextStyle(fontSize: 14.0),
                          decoration: InputDecoration(
                              labelText: 'Masukkan input',
                              labelStyle: TextStyle(fontSize: 14.0),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          child: Text('close'),
                        ),
                        ElevatedButton(
                          onPressed: () => {Navigator.of(context).pop()},
                          child: Text('create'),
                        )
                      ]);
                });
          },
          child: Icon(Icons.add),
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _num = 0;

  void _incrementCount() {
    setState(() {
      _num++;
    });
  }

  void _reset() {
    setState(() {
      _num = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TopInput(),
            SizedBox(height: 15),
            Row(
              children: [
                MyButton(
                  onPressed: _incrementCount,
                  text: 'increments',
                ),
                MyButton(
                  onPressed: _reset,
                  text: 'reset',
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Text('count : $_num'),
                SizedBox(
                  width: 15,
                ),
                ElevatedButton(onPressed: null, child: Text('button')),
              ],
            ),
            SizedBox(height: 15),
            ListGueRek(),
          ],
        ),
      ),
    );
  }
}

class ListGueRek extends StatefulWidget {
  const ListGueRek({super.key});

  @override
  State<ListGueRek> createState() => _ListGueRekState();
}

class _ListGueRekState extends State<ListGueRek> {
  List<Color> myColor = [
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.green,
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.green,
    Colors.green,
  ];

  List<Map<String, dynamic>> mahasiswa = [
    {
      "id": 1,
      "nama": "Muhammad Hanifs",
      "noHp": 081266600356,
      "favColor": ['red', 'yellow', 'green'],
    },
    {
      "id": 2,
      "nama": "Andhika",
      "noHp": 081266600356,
      "favColor": ['blue', 'orange', 'purple'],
    },
    {
      "id": 3,
      "nama": "Piere",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 4,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 5,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 6,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 7,
      "nama": "Andhika",
      "noHp": 081266600356,
      "favColor": ['blue', 'orange', 'purple'],
    },
    {
      "id": 8,
      "nama": "Piere",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 9,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 10,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
    {
      "id": 11,
      "nama": "adit",
      "noHp": 081266600356,
      "favColor": ['black', 'amber', 'sky'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: mahasiswa.map((data) {
        List favColor = data["favColor"];
        return Container(
          height: 100,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(data['nama']),
                      Text(data['noHp'].toString()),
                    ],
                  ),
                  Row(
                    children: favColor.map((color) {
                      return Container(
                        padding: EdgeInsets.all(2.0),
                        margin: EdgeInsets.only(right: 20),
                        child: Text(color),
                        color: Colors.amber,
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            color: Color.fromARGB(255, 104, 175, 234),
          ),
        );
      }).toList(),
    );
  }
}

class TopInput extends StatelessWidget {
  const TopInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: TextField(
            decoration: InputDecoration(
              labelText: 'Enter your text',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(
          width: 15,
        ),
        ElevatedButton(onPressed: null, child: Text('send')),
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  MyButton({required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
