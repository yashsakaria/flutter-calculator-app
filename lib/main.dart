import 'package:flutter/material.dart';
import 'package:calculator/Screens/calculator_screen.dart';
import 'package:provider/provider.dart';
import 'calculator_data.dart';

void main() {
  runApp(
    ChangeNotifierProvider<CalculatorData>(
      create: (context) => CalculatorData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}
