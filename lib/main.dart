import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Stepper'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String? title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Step> steps = [
    Step(title: Text('Step 1'), content: Text('Hello!'), isActive: true),
    Step(title: Text('Step 2'), content: Text('World!'), isActive: true),
    Step(title: Text('Step 3'), content: Text('Hello World!'), isActive: true),
  ];
  int _currentStep = 0;

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
            Text(
              'Stepper',
              style: Theme.of(context).textTheme.headline4,
            ),
            Stepper(
              steps: steps,
              currentStep: _currentStep,
              onStepContinue: _onStepContinue,
              onStepCancel: _onStepCancel,
            )
          ],
        ),
      ),
    );
  }

  void _onStepContinue() {
    setState(() {
      if (_currentStep < steps.length - 1) {
        _currentStep++;
      } else {
        _currentStep = 0;
      }
    });
  }

  void _onStepCancel() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep--;
      } else {
        _currentStep = 0;
      }
    });
  }
}

// class _MyHomePageState extends State<MyHomePage> {
//   int _currentStep = 0;
//   late List<Step> _steps;

//   @override
//   void initState() {
//     super.initState();
//     _steps = [
//       Step(
//         title: const Text('Step 1'),
//         content: const Text('Hello!'),
//         isActive: _currentStep >= 0,
//       ),
//       Step(
//         title: const Text('Step 2'),
//         content: const Text('World!'),
//         isActive: _currentStep >= 1,
//       ),
//       Step(
//         title: const Text('Step 3'),
//         content: const Text('Hello World!'),
//         isActive: _currentStep >= 2,
//       ),
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title!),
//       ),
//       body: Stepper(
//         steps: _steps,
//         currentStep: _currentStep,
//         onStepContinue: () {
//           setState(() {
//             if (_currentStep < _steps.length - 1) {
//               _currentStep++;
//             } else {
//               _currentStep = 0;
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             if (_currentStep > 0) {
//               _currentStep--;
//             } else {
//               _currentStep = 0;
//             }
//           });
//         },
//         onStepTapped: (step) {
//           setState(() {
//             _currentStep = step;
//           });
//         },
//       ),
//     );
//   }
// }
