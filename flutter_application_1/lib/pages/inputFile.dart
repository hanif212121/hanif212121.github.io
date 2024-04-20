import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:file_picker/file_picker.dart';

class UtilInputFile {
  static int indexFile = 0;
  static List _fileName = [];
  static List _files = [];
  static bool _isLoading = false;

  static Future pickFile() async {
    return await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'xlsx', 'png'],
    );
  }

  static void delete(index) {
    _fileName.removeWhere((i) => i['index'].toString() == index.toString());
  }
}

class InputFile extends StatefulWidget {
  @override
  State<InputFile> createState() => _InputFileState();
}

class _InputFileState extends State<InputFile> {
  void _pickFiles() async {
    setState(() {
      UtilInputFile._isLoading = true;
    });

    FilePickerResult? result = await UtilInputFile.pickFile();

    if (result != null) {
      setState(() {
        UtilInputFile._fileName.add({
          'index': UtilInputFile.indexFile,
          'nameFile': result.files.single.name
        });
        UtilInputFile._files.add(result.files);
        UtilInputFile.indexFile++;
      });

      print(UtilInputFile._fileName);
    }

    setState(() {
      UtilInputFile._isLoading = false;
    });
  }

  void checkVal() {
    print(UtilInputFile._fileName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Input file',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: UtilInputFile._isLoading
              ? null
              : () {
                  Navigator.pop(context);
                },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: checkVal,
        child: Icon(Icons.add),
      ),
      body: InputFileBody(pickFiles: _pickFiles),
    );
  }
}

class InputFileBody extends StatelessWidget {
  final VoidCallback pickFiles;

  InputFileBody({required this.pickFiles});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 14.0),
            decoration: InputDecoration(
              labelText: 'Masukkan nama',
              labelStyle: TextStyle(fontSize: 14.0),
              helperText: 'We will not share your email.',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          FilledButton.tonal(
            onPressed: UtilInputFile._isLoading ? null : pickFiles,
            child: Row(
              mainAxisSize:
                  MainAxisSize.min, // Gunakan min untuk menghindari stretching
              children: [
                Icon(Icons.add, color: Colors.white), // Menambahkan Icon
                SizedBox(width: 8), // Spasi antara icon dan teks
                Text('Tambahkan gambar'),
              ],
            ),
          ),
          SizedBox(height: 10),
          ImageListView()
        ],
      ),
    );
  }
}

class ImageListView extends StatefulWidget {
  ImageListView({super.key});

  @override
  State<ImageListView> createState() => _ImageListViewState();
}

class _ImageListViewState extends State<ImageListView> {
  final List fileName = UtilInputFile._fileName;

  void removeFile(index) {
    print(index);
    setState(() {
      UtilInputFile.delete(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: fileName.map((i) {
          return Container(
              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
              height: 250,
              color: Colors.amber,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(i['index'].toString()),
                    SizedBox(height: 50),
                    Text(i['nameFile']),
                    ElevatedButton(
                      onPressed: () => removeFile(i['index']),
                      child: Text('remove image'),
                    ),
                    Expanded(
                        child: Image.network(
                            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'))
                  ],
                ),
              ));
        }).toList(),
      ),
    );
  }
}
