import 'package:flutter/material.dart';

void main() {
  runApp(
      const MaterialApp(title: 'hola mundo', home: SafeArea(child: MyApp())));
}

class MyApp extends StatelessWidget {
  // This is the constructor for the MyApp class. It has a parameter called
  // key, and it passes the value of key to the superclass. The value of key
  // is
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            height: 56,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const IconButton(
                  onPressed: null,
                  icon: Icon(Icons.menu),
                  tooltip: 'Navigation menu',
                ),
                const Expanded(child: Text('Aplicación de ejemplo')),
                const IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                    tooltip: 'Search'),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Hola mundo',
                textDirection: TextDirection.ltr,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
