import 'package:calculator_tui/calculator_tui.dart' as calculator_tui;
import 'dart:io';

import 'package:calculator_tui/int_validation.dart';

void main(List<String> arguments) {
  int? firstNum;
  String? operator;
  int? secondNum;

  while(firstNum == null){
    firstNum = getValidInt();
  }
  while(operator == null){
    print("Enter an operator(+, -, *, /): ");
    operator = stdin.readLineSync();
    print(operator);
    if(operator != "+" && operator != "-" && operator != "*" && operator != "/"){
      print("Invalid Operator - please try again");
      operator = null;
    }
  }
  while(secondNum == null){
    secondNum = getValidInt();
  }
  print(calculator_tui.calculate(firstNum, operator, secondNum));
}
