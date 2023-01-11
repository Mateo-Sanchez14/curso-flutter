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
      //disable debug banner
      debugShowCheckedModeBanner: false,
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
      body: const Center(
        child: Text(
          'Hola Pauli',
          style: TextStyle(fontSize: 30, color: Colors.blueGrey),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _like,
        tooltip: 'Like',
        backgroundColor: Colors.blueGrey,
        //Si no es extended, el icono va como child y no se puede poner texto
        child: _corazon,
        //label: const Text('Like'),
      ),
      //Se puede poner el botón en donde queramos
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.home, color: Colors.white),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.search, color: Colors.white),
              // ),
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.add, color: Colors.white),
              // ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.person, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
