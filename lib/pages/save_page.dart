import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pass/db/conect.dart';
import 'package:pass/models/datos.dart';

class SavePage extends StatelessWidget {
  const SavePage({Key? key}) : super(key: key);
  static const String route = "/save";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear NUEVO Usuario/Clave"),
      ),
      body: Container(
        child: _FormSave(),
      ),
    );
  }
}

class _FormSave extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formkey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: usuarioController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ingrese el Usuario";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Usuario",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Ingrese el Password";
                }
                return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                labelText: "Contraseña",
              ),
            ),
            OutlinedButton(
              child: const Text("Guardar"),
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  print("guardado " + usuarioController.text);

                  Conect.insert(Datos(
                    Random().nextInt(100),
                    user: usuarioController.text,
                    pass: passwordController.text,
                  ));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
