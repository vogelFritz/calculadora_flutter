import 'package:calculadora/presentation/providers/display_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});
  @override
  Widget build(BuildContext context) {
    final displayProvider = context.watch<DisplayProvider>();
    return Column(
      children: [
        Container(
            constraints: const BoxConstraints(
                maxHeight: 100, maxWidth: 500, minHeight: 100, minWidth: 100),
            child: Column(
              children: [
                Text(displayProvider.display,
                    style: const TextStyle(fontSize: 50)),
                Text(displayProvider.result)
              ],
            )),
        ConstrainedBox(
          constraints: const BoxConstraints(
              maxWidth: 500, maxHeight: 500, minHeight: 100, minWidth: 100),
          child: GridView.count(crossAxisCount: 5, children: [
            CalculatorButton(
                content: '7',
                func: () {
                  displayProvider.displayPrint('7');
                  displayProvider.expresion.agregarDigito('7');
                }),
            CalculatorButton(
                content: '8',
                func: () {
                  displayProvider.displayPrint('8');
                  displayProvider.expresion.agregarDigito('8');
                }),
            CalculatorButton(
                content: '9',
                func: () {
                  displayProvider.displayPrint('9');
                  displayProvider.expresion.agregarDigito('9');
                }),
            CalculatorButton(
                content: 'DEL',
                func: () {
                  displayProvider.displayDel();
                }),
            CalculatorButton(
                content: 'AC',
                func: () {
                  displayProvider.displayReset();
                }),
            CalculatorButton(
                content: '4',
                func: () {
                  displayProvider.displayPrint('4');
                  displayProvider.expresion.agregarDigito('4');
                }),
            CalculatorButton(
                content: '5',
                func: () {
                  displayProvider.displayPrint('5');
                  displayProvider.expresion.agregarDigito('5');
                }),
            CalculatorButton(
                content: '6',
                func: () {
                  displayProvider.displayPrint('6');
                  displayProvider.expresion.agregarDigito('6');
                }),
            CalculatorButton(
                content: 'X',
                func: () {
                  displayProvider.displayPrint('X');
                  displayProvider.expresion.agregarOperador('*');
                }),
            CalculatorButton(
                content: '/',
                func: () {
                  displayProvider.displayPrint('/');
                  displayProvider.expresion.agregarOperador('/');
                }),
            CalculatorButton(
                content: '1',
                func: () {
                  displayProvider.displayPrint('1');
                  displayProvider.expresion.agregarDigito('1');
                }),
            CalculatorButton(
                content: '2',
                func: () {
                  displayProvider.displayPrint('2');
                  displayProvider.expresion.agregarDigito('2');
                }),
            CalculatorButton(
                content: '3',
                func: () {
                  displayProvider.displayPrint('3');
                  displayProvider.expresion.agregarDigito('3');
                }),
            CalculatorButton(
                content: '+',
                func: () {
                  displayProvider.displayPrint('+');
                  displayProvider.expresion.agregarOperador('+');
                }),
            CalculatorButton(
                content: '-',
                func: () {
                  displayProvider.displayPrint('-');
                  displayProvider.expresion.agregarOperador('-');
                }),
            CalculatorButton(
                content: '0',
                func: () {
                  displayProvider.displayPrint('0');
                  displayProvider.expresion.agregarDigito('0');
                }),
            CalculatorButton(
                content: '.',
                func: () {
                  displayProvider.displayPrint('.');
                  displayProvider.expresion.agregarDigito('.');
                }),
            CalculatorButton(
                content: 'EXP',
                func: () {
                  displayProvider.displayPrint('EXP');
                }),
            CalculatorButton(
                content: 'ANS',
                func: () {
                  String auxAns = displayProvider.ans.toString();
                  displayProvider.displayPrint('ANS');
                  for (int i = 0; i < auxAns.length; i++) {
                    displayProvider.expresion.agregarDigito(auxAns[i]);
                  }
                }),
            CalculatorButton(
                content: '=',
                func: () {
                  displayProvider.displayPrintResult();
                }),
          ]),
        ),
      ],
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {super.key, required this.content, required this.func});
  final String content;
  final void Function() func;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
        onPressed: func,
        style: FilledButton.styleFrom(
            side: const BorderSide(width: 2, color: Colors.black)),
        child: Text(content,
            style: const TextStyle(
              color: Colors.black,
            )));
  }
}
