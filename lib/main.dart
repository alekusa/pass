import 'package:flutter/material.dart';
import 'package:pass/pages/list_page.dart';
import 'package:pass/pages/save_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: ListPage.route,
      routes: {
        ListPage.route: (_) => const ListPage(),
        SavePage.route: (_) => const SavePage()
      },
    );
  }
}
