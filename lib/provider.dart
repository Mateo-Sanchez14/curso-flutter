import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'contador_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'StatelessAPP',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => ContadorProvider(0),
          child: MyHomePage(title: 'StatelessAPP Home Page'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    final _contadorProvider = Provider.of<ContadorProvider>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('You have pushed the button this many times:'),
              Text(
                '${_contadorProvider.contador}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _contadorProvider.incrementar,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
