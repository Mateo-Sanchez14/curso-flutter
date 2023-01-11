import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Botones',
      home: MyHomePage(
        title: 'Botones',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({this.title, super.key});
  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String botonPulsado = 'ninguno';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('El botón pulsado es:',
                style: const TextStyle(fontSize: 20)),
            Text(
              botonPulsado,
              style: const TextStyle(fontSize: 40, color: Colors.blue),
            ),
            const Padding(padding: EdgeInsets.all(20)), // Separador
            ElevatedButton(
              onPressed: () => _wichButtonPressed('ElevatedButton'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                elevation: 10,
                shadowColor: Colors.red,
              ),
              child: const Text('ElevatedButton'),
            ),
            const Padding(padding: EdgeInsets.all(5)), // Separador
            TextButton(
              onPressed: () => _wichButtonPressed('TextButton'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('TextButton'),
            ),
            const Padding(padding: EdgeInsets.all(5)), // Separador
            IconButton(
              onPressed: () => _wichButtonPressed('IconButton'),
              icon: const Icon(Icons.accessibility_new_rounded),
              color: Colors.black,
              iconSize: 50,
            ),
            const Padding(padding: EdgeInsets.all(5)), // Separador
            Ink(
              decoration: ShapeDecoration(
                shape: const CircleBorder(),
                color: Colors.blue,
              ),
              child: IconButton(
                onPressed: () => _wichButtonPressed('IconButton with Ink'),
                icon: const Icon(Icons.accessibility),
                color: Colors.white,
                iconSize: 50,
              ),
            ),
            const Padding(padding: EdgeInsets.all(5)), // Separador
            OutlinedButton(
              onPressed: () => _wichButtonPressed('OutlinedButton'),
              style: OutlinedButton.styleFrom(
                primary: Colors.blue,
                side: const BorderSide(color: Colors.blue, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('OutlinedButton'),
            ),
            const Padding(padding: EdgeInsets.all(5)), // Separador
            CupertinoButton(
              onPressed: () => _wichButtonPressed('CupertinoButton'),
              color: Colors.blue,
              child: const Text('CupertinoButton'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _floatingActionButtonPressed,
        tooltip: 'Press me',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  void _floatingActionButtonPressed() {
    _wichButtonPressed('FloatingActionButton');
  }

  void _wichButtonPressed(String buttonName) {
    setState(() {
      botonPulsado = buttonName;
    });
  }
}
