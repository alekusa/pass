import 'package:pass/models/datos.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'package:path/path.dart';

class Conect {
  static Future<Database> _openDB() async {
    return openDatabase(join(await getDatabasesPath(), 'passDB1.dart'),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE tablaUserPass(id INTEGER PRIMARY KEY AUTOINCREMENT, user TEXT, pass TEXT)");
    }, version: 1);
  }

  static Future<void> insert(Datos datos) async {
    final database = await _openDB();
    await database.insert(
      "tablaUserPass",
      datos.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Datos>> listaDatos() async {
    final database = await _openDB();
    final List<Map<String, dynamic>> datosMap =
        await database.query('tablaUserPass');

    for (var n in datosMap) {
      print("__" + n['user'] + " " + n['id'].toString() + " " + n['pass']);
    }
    return List.generate(datosMap.length, (i) {
      return Datos(
        datosMap[i]['id'],
        user: datosMap[i]['user'],
        pass: datosMap[i]['pass'],
      );
    });
  }

  static Future<void> delete(Datos datos) async {
    final database = await _openDB();
    await database
        .delete("tablaUserPass", where: 'id = ?', whereArgs: [datos.id]);
  }
}
