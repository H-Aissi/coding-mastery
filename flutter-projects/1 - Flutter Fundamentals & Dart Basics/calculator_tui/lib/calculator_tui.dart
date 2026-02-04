int calculate(int first,String op,int second) {
  double result = 0.0;
  if(op == "+"){
    result = (first + second).toDouble();
  }
  else if(op == "-"){
    result = (first - second).toDouble();
  }
  else if(op == "*"){
    result = (first * second).toDouble();
  }
  else if(op == "/"){
    if (second == 0) return 0;
    result = first / second;
  }
  int endresult = result.toInt();
  return endresult;
}
