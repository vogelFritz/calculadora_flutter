import 'package:calculadora/presentation/providers/display_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calculadora extends StatelessWidget {
  const Calculadora({super.key});
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final displayProvider = context.watch<DisplayProvider>();
    return Column(
      children: [
        Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                    colors: [Color.fromARGB(255, 66, 38, 38), Colors.black]),
                border: Border.all(width: 7.0, color: colors.primary)),
            width: double.infinity,
            height: 120,
            child: Column(
              children: [
                Text(displayProvider.display,
                    style: const TextStyle(fontSize: 50, color: Colors.white)),
                Text(displayProvider.result,
                    style: const TextStyle(color: Colors.white))
              ],
            )),
        Container(
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [Colors.blue, Colors.black]),
              border: Border.all(
                width: 7.0,
                color: colors.primary,
              )),
          width: double.infinity,
          height: 500,
          child: GridView.count(
              padding: const EdgeInsets.only(left: 300),
              scrollDirection: Axis.horizontal,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              crossAxisCount: 4,
              children: [
                CalculatorButton(
                    content: '7',
                    func: () {
                      displayProvider.displayPrint('7');
                    }),
                CalculatorButton(
                    content: '4',
                    func: () {
                      displayProvider.displayPrint('4');
                    }),
                CalculatorButton(
                    content: '1',
                    func: () {
                      displayProvider.displayPrint('1');
                    }),
                CalculatorButton(
                    content: '0',
                    func: () {
                      displayProvider.displayPrint('0');
                    }),
                CalculatorButton(
                    content: '8',
                    func: () {
                      displayProvider.displayPrint('8');
                    }),
                CalculatorButton(
                    content: '5',
                    func: () {
                      displayProvider.displayPrint('5');
                    }),
                CalculatorButton(
                    content: '2',
                    func: () {
                      displayProvider.displayPrint('2');
                    }),
                CalculatorButton(
                    content: '.',
                    func: () {
                      displayProvider.displayPrint('.');
                    }),
                CalculatorButton(
                    content: '9',
                    func: () {
                      displayProvider.displayPrint('9');
                    }),
                CalculatorButton(
                    content: '6',
                    func: () {
                      displayProvider.displayPrint('6');
                    }),
                CalculatorButton(
                    content: '3',
                    func: () {
                      displayProvider.displayPrint('3');
                    }),
                CalculatorButton(
                    content: 'EXP',
                    func: () {
                      displayProvider.displayPrint('EXP');
                    }),
                CalculatorButton(
                    content: 'DEL',
                    func: () {
                      displayProvider.displayDel();
                    }),
                CalculatorButton(
                    content: 'X',
                    func: () {
                      displayProvider.displayPrint('*');
                    }),
                CalculatorButton(
                    content: '+',
                    func: () {
                      displayProvider.displayPrint('+');
                    }),
                CalculatorButton(
                    content: 'ANS',
                    func: () {
                      String auxAns = displayProvider.ans.toString();
                      displayProvider.displayPrint(auxAns);
                    }),
                CalculatorButton(
                    content: 'AC',
                    func: () {
                      displayProvider.displayReset();
                    }),
                CalculatorButton(
                    content: '/',
                    func: () {
                      displayProvider.displayPrint('/');
                    }),
                CalculatorButton(
                    content: '-',
                    func: () {
                      displayProvider.displayPrint('-');
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
