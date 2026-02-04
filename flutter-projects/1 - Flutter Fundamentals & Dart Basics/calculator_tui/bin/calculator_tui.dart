import 'package:calculator_tui/calculator_tui.dart' as calculator_tui;
import 'dart:io';

void main(List<String> arguments) {
  print('First Number:    ');
  String? firstNumber = stdin.readLineSync();
  print('choose an operation ( + - * / ):   ');
  String? operation = stdin.readLineSync();
  print('Second Number:   ');
  String? secondNumber = stdin.readLineSync();
  int firstNumberInt = int.parse(firstNumber!);
  String operationString = operation.toString();
  int secondNumberInt = int.parse(secondNumber!);
  print('Result ===   ${calculator_tui.calculate(firstNumberInt, operationString, secondNumberInt)}');
}
