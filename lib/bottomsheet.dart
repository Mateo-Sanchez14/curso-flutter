import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Bottom Sheet Home Page'),
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
              child: const Text('Show Bottom Sheet'),
            ),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
              onPressed: _elegirOpcionCuppertino,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32.0),
                ),
              ),
              child: const Text('Show Cuppertino Bottom Sheet'),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
    switch (await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 300.0,
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'Elige una opción',
                style: TextStyle(fontSize: 20.0, color: Colors.indigo),
              ),
              const SizedBox(height: 10.0),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.fastfood),
                title: const Text('Hamburguesa'),
                onTap: () {
                  Navigator.pop(context, ListaOpciones.hamburguesa);
                },
              ),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.fastfood),
                title: const Text('Pizza'),
                onTap: () {
                  Navigator.pop(context, ListaOpciones.pizza);
                },
              ),
              const Divider(
                height: 5,
              ),
              ListTile(
                leading: const Icon(Icons.fastfood),
                title: const Text('Pancho'),
                onTap: () {
                  Navigator.pop(context, ListaOpciones.pancho);
                },
              ),
            ],
          ),
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

  Future<void> _elegirOpcionCuppertino() async {
    switch (await showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Elige una opción'),
          message: const Text('Selecciona una opción'),
          actions: [
            CupertinoActionSheetAction(
              child: Row(
                children: const [
                  Icon(Icons.fastfood),
                  SizedBox(width: 10),
                  Text('Hamburguesa'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.hamburguesa);
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: const [
                  Icon(Icons.fastfood),
                  SizedBox(width: 10),
                  Text('Pizza'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.pizza);
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: const [
                  Icon(Icons.fastfood),
                  SizedBox(width: 10),
                  Text('Pancho'),
                ],
              ),
              onPressed: () {
                Navigator.pop(context, ListaOpciones.pancho);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancelar'),
            onPressed: () {
              Navigator.pop(context, 'Cancelar');
            },
          ),
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
