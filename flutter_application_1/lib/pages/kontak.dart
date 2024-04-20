import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/services.dart';

class CustomClassKontak {
  static List data = [];
}

class Kontak extends StatefulWidget {
  @override
  State<Kontak> createState() => _KontakState();
}

class _KontakState extends State<Kontak> {
  int _num = 0;
  int incrementCard = 0;

  void _addKontak(inputNama, nomorHp) {
    setState(() {
      CustomClassKontak.data.add({
        "indexCard": incrementCard,
        "nama": inputNama,
        "noHp": nomorHp.toString(),
      });
    });
    incrementCard++;
  }

  void _deleteKontak(indexCard) {
    setState(() {
      CustomClassKontak.data
          .removeWhere((i) => i['indexCard'].toString() == indexCard);
    });
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
                return TextFieldDialog(
                    onCreate: (inputNama, nomorHp) => {
                          _addKontak(inputNama, nomorHp),
                        });
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
              ListGueRek(myData: {
                'databaseKotak': CustomClassKontak.data,
                'incrementCard': incrementCard,
                'deleteKontak': _deleteKontak
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFieldDialog extends StatelessWidget {
  final Function(dynamic, dynamic) onCreate;
  final TextEditingController inputNama = TextEditingController();
  final TextEditingController nomorHp = TextEditingController();

  TextFieldDialog({
    required this.onCreate,
  });

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
        // height: 200,
        padding:
            EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: inputNama,
              style: TextStyle(fontSize: 14.0),
              decoration: InputDecoration(
                labelText: 'Masukkan nama',
                labelStyle: TextStyle(fontSize: 14.0),
                helperText: 'We will not share your email.',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            TextField(
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
              controller: nomorHp,
              style: TextStyle(fontSize: 14.0),
              decoration: InputDecoration(
                  labelText: 'Masukkan nomor hp',
                  labelStyle: TextStyle(fontSize: 14.0),
                  border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: Text('close'),
        ),
        ElevatedButton(
          onPressed: () => {
            onCreate(inputNama.text, nomorHp.text),
            Navigator.of(context).pop(),
          },
          child: Text('create'),
        )
      ],
    );
  }
}

class ListGueRek extends StatelessWidget {
  final Map myData;

  ListGueRek({required this.myData});

  final List<Color> myColor = [
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
    List? databaseKotak = myData['databaseKotak'];
    int? incrementCard = myData['incrementCard'];
    var deleteKontak = myData['deleteKontak'];

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['nama'],
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data['noHp'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        data['indexCard'].toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        incrementCard.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        color: Colors.amber,
                        onPressed: () {
                          deleteKontak(data['indexCard'].toString());
                          print('IconButton pressed');
                        },
                        tooltip: 'delete',
                      ),
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
