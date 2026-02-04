import 'package:calculator_tui/calculator_tui.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate(2, "+", 5), 7);
  });
}
