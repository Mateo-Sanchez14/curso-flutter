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
            height: 65,
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              color: Colors.blueAccent,
            ),
            child: Row(
              children: const [
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.menu),
                  tooltip: 'Navigation menu',
                ),
                Expanded(child: Text('Aplicación de ejemplo')),
                IconButton(
                    onPressed: null,
                    icon: Icon(Icons.search),
                    tooltip: 'Search'),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                'Hola Pauli',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
