import 'package:calculadora/presentation/calculadora/calculadora.dart';
import 'package:calculadora/presentation/providers/display_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DisplayProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: const Text('Calculadora'), centerTitle: true),
          body: const Center(
            child: Calculadora(),
          ),
        ),
      ),
    );
  }
}
