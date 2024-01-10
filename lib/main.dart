import 'package:flutter/material.dart';
import 'save_screen.dart';
import 'read_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firestore Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SaveScreen(),
      routes: {
        '/read': (context) => ReadScreen(),
      },
    );
  }
}
