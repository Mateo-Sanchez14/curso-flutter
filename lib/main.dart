import 'package:flutter/material.dart';
import 'package:widgets_testing/control_contador.dart';

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
      home: const MyHomePage(title: 'StatefullAPP Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ControlContador _controlContador = ControlContador();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _controlContador.stream,
        initialData: 0,
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _controlContador.incrementar,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        });
  }

  @override
  void dispose() {
    _controlContador.dispose();
    super.dispose();
  }
}
