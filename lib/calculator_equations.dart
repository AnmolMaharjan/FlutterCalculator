import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/widgets.dart';

class CalculatorEquations with ChangeNotifier {
  String equation = '';
  String result = '';

  void CalcOperators(String sign, bool canFirst, BuildContext context) {
    if (equation == '') {
      if (sign == '.') {
        equation = '0.';
      } else if (sign == '+') {
        return;
      } else if (canFirst) {
        if (sign == "√x") {
          sign = "√";
        }
        equation = sign;
      }
    } else {
      if (sign == "AC") {
        equation = '';
        result = '';
      } else if (sign == "⌫") {
        if (equation.endsWith(' ')) {
          equation = equation.substring(0, equation.length - 3);
        } else {
          equation = equation.substring(0, equation.length - 1);
        }
      } else if ((equation.endsWith('.') && sign == '.') ||
          (equation.endsWith('²') && sign == '²')) {
        return;
      } else if (equation.endsWith(' ') && sign == '.') {
        equation = '${equation}0.';
      } else if (equation.endsWith(' ') && canFirst == false) {
        equation = equation.substring(0, equation.length - 3) + sign;
      } else if (sign == '=') {
        equation = result;
        result = "";
      } else if (sign == "x²") {
        sign = "²";
        equation = equation + sign;
      } else if (sign == "xʸ") {
        sign = "^";
        equation = equation + sign;
      } else if (sign == "√x") {
        sign = "√";
        equation = equation + sign;
      } else {
        equation = equation + sign;
      }
    }
    if (equation == '0') {
      equation = '';
    }
    try {
      var Answer = "";
      Answer = equation;
      Answer = Answer.replaceAll('÷', '/');
      Answer = Answer.replaceAll('×', '*');
      Answer = Answer.replaceAll("%", "* 0.01");
      Answer = Answer.replaceAll("√", "sqrt");
      Answer = Answer.replaceAll("²", "^2");
      // privateResult = privateResult.replaceAll("xʸ", "^");
      Answer = Answer.replaceAll("π",
          "3.1415926535897932384626433832795028841971693993751058209749445923078164062862089986280348253421170679");
      Answer = Answer.replaceAll("e", 'e^1');
      // privateResult = privateResult.replaceAll("(", "*(");
      Parser p = Parser();
      Expression exp = p.parse(Answer);
      ContextModel cm = ContextModel();
      result = '${exp.evaluate(EvaluationType.REAL, cm)}';
      if (result.endsWith('.0')) {
        result = result.substring(0, result.length - 2);
      }
    } catch (e) {
      result = "";
      if (equation != "") {
        result = "Error";
      }
    }
    notifyListeners();
  }
}
