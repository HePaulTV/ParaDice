import 'package:flutter/material.dart';
import 'dice_pool_6.dart';
import 'dice_pool_10.dart';
import 'myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lanceur de dés Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Lanceur de dés Flutter'),
    );
  }
}

