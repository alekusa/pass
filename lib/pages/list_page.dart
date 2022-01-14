import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pass/models/datos.dart';
import 'package:pass/pages/save_page.dart';
import 'package:pass/db/conect.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  static const String route = "/";
  @override
  Widget build(BuildContext context) {
    Conect.listaDatos();
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
        child: _listado(),
      ),
    );
  }
}

class _listado extends StatefulWidget {
  @override
  State<_listado> createState() => _listadoState();
}

class _listadoState extends State<_listado> {
  List<Datos> data = [];

  @override
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (_, i) => _createItems(i),
    );
  }

  _loadData() async {
    List<Datos> auxList = await Conect.listaDatos();

    setState(() {
      data = auxList;
    });
  }

  _createItems(int i) {
    return Dismissible(
      key: Key(i.toString()),
      direction: DismissDirection.startToEnd,
      background: Container(
        padding: const EdgeInsets.all(5),
        child: const Align(
          alignment: Alignment.topRight,
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
      ),
      onDismissed: (direction) {
        print(direction);
        Conect.delete(data[i]);
      },
      child: ListTile(
        title: Text(data[i].user),
        subtitle: Text(data[i].pass + " id " + data[i].id.toString()),
      ),
    );
  }
}
