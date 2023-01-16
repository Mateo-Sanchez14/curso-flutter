import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SimpleDialogApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Simple Dialog Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _respuesta = 'Ninguna';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _elegirOpcion,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Text('Show Simple Dialog'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                const Text(
                  'La respuesta es: ',
                  style: TextStyle(fontSize: 20.0, color: Colors.indigo),
                ),
                Text(
                  _respuesta,
                  style: const TextStyle(
                      fontSize: 30.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _elegirOpcion() async {
    switch (await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Elige una opción'),
          children: [
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.fastfood),
                  SizedBox(width: 10.0),
                  Text('Hamburguesa'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.hamburguesa);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.local_pizza),
                  SizedBox(width: 10.0),
                  Text('Pizza'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.pizza);
              },
            ),
            SimpleDialogOption(
              child: Row(
                children: const [
                  Icon(Icons.food_bank),
                  SizedBox(width: 10.0),
                  Text('Pancho'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.pancho);
              },
            ),
          ],
        );
      },
    )) {
      case ListaOpciones.hamburguesa:
        _opcionElegida('Hamburguesa');
        break;
      case ListaOpciones.pizza:
        _opcionElegida('Pizza');
        break;
      case ListaOpciones.pancho:
        _opcionElegida('Pancho');
        break;
      default:
        _opcionElegida('Ninguna');
    }
  }

  void _opcionElegida(String opcion) {
    setState(() {
      _respuesta = opcion;
    });
  }
}

enum ListaOpciones { hamburguesa, pizza, pancho }
