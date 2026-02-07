String calculate(int? first,String? op,int? second) {
  first!;
  second!;

  int result = 0;
  if(op == "+"){
    result = first + second;
  }
  else if(op == "-"){
    result = first - second;
  }
  else if(op == "*"){
    result = first * second;
  }
  else if(op == "/"){
    if (second == 0) return "can not divide through zero";
    result = (first / second).toInt();
  }else{
    return "invalid operator - please try again";
  }
  
  String endresult = result.toString();
  return "Result: $endresult";
}
