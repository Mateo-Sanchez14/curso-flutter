import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp(
    title: 'Imagenes',
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imagenes'),
        ),
        body: MyHomePage(title),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor:
          2, //El centro se transforma en 2 veces el alto del Containter
      widthFactor: 1,
      child: Container(
        color: Colors.purple,
        child: const Text(
          'Texto en el contenedor',
          style: TextStyle(
            fontSize: 30,
            color: Colors.black,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
    );
  }
}
