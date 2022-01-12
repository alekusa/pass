import 'package:flutter/material.dart';
import 'package:pass/pages/save_page.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  static const String route = "/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, SavePage.route);
        },
      ),
      appBar: AppBar(
        title: const Text("Mis Claves"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text("alekusa@gmail.com"),
              subtitle: Text("aDk/14274"),
            ),
            ListTile(
              title: const Text("courseswhile@gmail.com"),
              subtitle: const Text("adK/0852"),
            ),
            ListTile(
              title: Text("Nota 1"),
            ),
            ListTile(
              title: Text("Nota 1"),
            ),
          ],
        ),
      ),
    );
  }
}
