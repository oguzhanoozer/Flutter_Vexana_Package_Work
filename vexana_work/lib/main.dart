import 'package:flutter/material.dart';
import 'package:vexana_work/rickmorty/rickmorty.dart';
import 'rickmorty/rickmorty_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: rickmorty());
  }
}
