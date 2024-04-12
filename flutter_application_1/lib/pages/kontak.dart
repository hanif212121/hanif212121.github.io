import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Kontak extends StatefulWidget {
  @override
  State<Kontak> createState() => _KontakState();
}

class _KontakState extends State<Kontak> {
  List data = [];

  int _num = 0;

  void _addKontak() {
    setState(() {
      data.add({
        "nama": "muhammad hanif",
        "noHp": 1812,
      });
    });

    print('asdads');
  }

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
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Kontakku')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return TextFieldDialog(addKontak: _addKontak);
              });
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              TopInput(),
              SizedBox(height: 15),
              Row(
                children: [
                  MyButton(
                    onPressed: _addKontak,
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
              ListGueRek(databaseKotak: data),
            ],
          ),
        ),
      ),
    );
  }
}

class ListGueRek extends StatelessWidget {
  final List? databaseKotak;

  ListGueRek({required this.databaseKotak});

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: databaseKotak!.map((data) {
        List<dynamic>? favColor = data["favColor"];
        return Container(
          height: 100,
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(data['nama']),
                      Text(data['noHp'].toString()),
                    ],
                  ),
                  if (favColor != null)
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: favColor.map((color) {
                          return Container(
                            padding: EdgeInsets.all(2.0),
                            margin: EdgeInsets.only(right: 20),
                            child: Text(color),
                            color: Colors.amber,
                          );
                        }).toList(),
                      ),
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

class TextFieldDialog extends StatefulWidget {
  final VoidCallback addKontak;
  final Function(dynamic) onInputed;

  TextFieldDialog({required this.addKontak, required this.onInputed});

  @override
  State<TextFieldDialog> createState() => _TextFieldDialogState();
}

class _TextFieldDialogState extends State<TextFieldDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      content: Container(
        width: double.maxFinite,
        padding:
            EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
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
          onPressed: widget.addKontak,
          // onPressed: () => {Navigator.of(context).pop()},

          child: Text('create'),
        )
      ],
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
