import 'dart:io';

String calculateResult(String input) {
	try {
		final expr = input.replaceAll(' ', '');
		if (expr.isEmpty) return '0';
		final rpn = _toRPN(expr);
		final value = _evalRPN(rpn);
		if (value.isInfinite || value.isNaN) return 'Error';
		if (value == value.roundToDouble()) return value.toInt().toString();
		return value.toString();
	} catch (e) {
		return 'Error';
	}
}

List<String> _toRPN(String input) {
	final tokens = <String>[];
	final ops = '+-*/()';

	for (int i = 0; i < input.length; i++) {
		final ch = input[i];
		if (ch == ' ') continue;
		if ((ch == '-' && (i == 0 || ops.contains(input[i - 1]) && input[i - 1] != ')')) ||
				_isDigit(ch) || ch == '.') {
			final start = i;
			i++;
			while (i < input.length && (_isDigit(input[i]) || input[i] == '.')) i++;
			tokens.add(input.substring(start, i));
			i--;
		} else if (ops.contains(ch)) {
			tokens.add(ch);
		} else {
			throw FormatException('Invalid character: $ch');
		}
	}

	final output = <String>[];
	final stack = <String>[];

	int prec(String op) {
		if (op == '+' || op == '-') return 1;
		if (op == '*' || op == '/') return 2;
		return 0;
	}

	for (final token in tokens) {
		if (token.isEmpty) continue;
		if (_isNumberToken(token)) {
			output.add(token);
		} else if (token == '(') {
			stack.add(token);
		} else if (token == ')') {
			while (stack.isNotEmpty && stack.last != '(') {
				output.add(stack.removeLast());
			}
			if (stack.isEmpty) throw FormatException('Mismatched parentheses');
			stack.removeLast();
		} else {
			while (stack.isNotEmpty && prec(stack.last) >= prec(token)) {
				output.add(stack.removeLast());
			}
			stack.add(token);
		}
	}

	while (stack.isNotEmpty) {
		final top = stack.removeLast();
		if (top == '(' || top == ')') throw FormatException('Mismatched parentheses');
		output.add(top);
	}

	return output;
}

double _evalRPN(List<String> rpn) {
	final stack = <double>[];
	for (final token in rpn) {
		if (_isNumberToken(token)) {
			stack.add(double.parse(token));
		} else {
			if (stack.length < 2) throw FormatException('Invalid expression');
			final b = stack.removeLast();
			final a = stack.removeLast();
			double res;
			switch (token) {
				case '+':
					res = a + b;
					break;
				case '-':
					res = a - b;
					break;
				case '*':
					res = a * b;
					break;
				case '/':
					res = a / b;
					break;
				default:
					throw FormatException('Unknown operator: $token');
			}
			stack.add(res);
		}
	}
	if (stack.length != 1) throw FormatException('Invalid expression');
	return stack.single;
}

bool _isDigit(String ch) => ch.codeUnitAt(0) >= 48 && ch.codeUnitAt(0) <= 57;

bool _isNumberToken(String s) {
	if (s.isEmpty) return false;
	final start = (s[0] == '-' ? 1 : 0);
	var dotCount = 0;
	for (int i = start; i < s.length; i++) {
		final c = s[i];
		if (c == '.') {
			dotCount++;
			if (dotCount > 1) return false;
		} else if (!_isDigit(c)) return false;
	}
	return true;
}