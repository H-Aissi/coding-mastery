import 'dart:io';

int? getValidInt(){
  print("Enter an integer: ");
  String? input = stdin.readLineSync();

  if(input == null || input.isEmpty){
    print("You have to enter an integer - please try again"); 
  } 

  int? num = int.tryParse(input!);
  if(num == null){
    print("Error: $input is not a valid entry");
  } else return num;
  return null;
}