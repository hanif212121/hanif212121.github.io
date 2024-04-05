import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            'Main Page',
            style: TextStyle(color: Colors.white),
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                color: Colors.white,
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            PopupMenuButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white, // Mengatur warna ikon menjadi merah
              ),
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem(
                    child: Text("Item 1"),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Item 2"),
                    value: 2,
                  ),
                ];
              },
              onSelected: (value) {
                // Tindakan saat item menu dipilih
              },
            ),
          ],
        ),
        drawer: Mydrawer(),
        body: Center(
          child: Text('Hello, world!'),
        ));
  }
}

class Mydrawer extends StatelessWidget {
  const Mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 100,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Header Drawer',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                    onPressed: () => {Navigator.pop(context)},
                    tooltip: 'close',
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ListTile(
            title: Text('Menu utama'),
            onTap: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          ListTile(
            title: Text('Kontak'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed('/kontak');
            },
          ),
        ],
      ),
    );
  }
}
