import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatefullAPP',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'StatefullAPP Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String? title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          backgroundColor: color,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('El color actual es: '),
              Container(
                width: 100,
                height: 100,
                color: color,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _cambiarColor,
          child: Icon(Icons.colorize_rounded, color: color),
        ));
  }

  void _cambiarColor() {
    setState(() {
      color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    });
  }
}
