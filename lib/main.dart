import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScafoldApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ScafoldApp Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Icon _corazon = const Icon(Icons.favorite_border, color: Colors.white);
  bool _corazonPulsado = false;

  void _like() {
    setState(() {
      if (_corazonPulsado) {
        _corazon = const Icon(Icons.favorite_border, color: Colors.white);
        _corazonPulsado = false;
      } else {
        _corazon = const Icon(Icons.favorite, color: Colors.red);
        _corazonPulsado = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: _like,
            icon: _corazon,
          ),
        ],
      ),
    );
  }
}
