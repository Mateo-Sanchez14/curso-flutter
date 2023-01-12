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
  MyHomePage(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
            width: 200,
            height: 200,
          ),
          Image.asset(
            '/assets/images/imagen1.png',
            width: 200,
            height: 200,
          ),
        ],
      ),
    );
  }
}
