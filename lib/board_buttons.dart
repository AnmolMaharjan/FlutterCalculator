import 'package:calculator/calculator_equations.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

const buttonsBackgroundColor = Color(0xff22252D);
const amberColor = Color(0xFFFF8F00);
const greyColor = Color(0xFF616161);
const whiteColor = Colors.white;
const redColor = Color(0xFFB71C1C);

AppBar appbar(
  BuildContext context,
  String title,
  IconData icon,
  Function() tap,
) {
  return AppBar(
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.w400),
    ),
    actions: [
      IconButton(
        onPressed: tap,
        icon: Icon(icon),
      ),
    ],
  );
}

class CalculatorButton extends StatelessWidget {
  final String label;
  final bool isColored, isAmberColor, isGreyColor, isRedColor, canBeFirst;
  const CalculatorButton(
    this.label, {
    this.isColored = false,
    this.isAmberColor = false,
    this.isGreyColor = false,
    this.isRedColor = false,
    this.canBeFirst = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculatorProvider =
        Provider.of<CalculatorEquations>(context, listen: false);
    final TextStyle? textStyle = Theme.of(context).textTheme.headline6;
    final mediaQuery = MediaQuery.of(context).size;
    return Material(
      color: buttonsBackgroundColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(20.0),
        onTap: () {
          calculatorProvider.CalcOperators(
            label,
            canBeFirst,
            context,
          );
        },
        child: Center(
          child: isAmberColor
              ? Container(
                  height: mediaQuery.width * 0.1,
                  width: mediaQuery.width * 0.1,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    color: amberColor,
                  ),
                  child: Center(
                    child: Text(
                      label,
                      style: textStyle?.copyWith(color: whiteColor),
                    ),
                  ),
                )
              : isRedColor
                  ? Container(
                      height: mediaQuery.width * 0.1,
                      width: mediaQuery.width * 0.1,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        color: redColor,
                      ),
                      child: Center(
                        child: Text(
                          label,
                          style: textStyle?.copyWith(color: whiteColor),
                        ),
                      ),
                    )
                  : isGreyColor
                      ? Container(
                          height: mediaQuery.width * 0.1,
                          width: mediaQuery.width * 0.1,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            color: greyColor,
                          ),
                          child: Center(
                            child: Text(
                              label,
                              style: textStyle?.copyWith(color: whiteColor),
                            ),
                          ),
                        )
                      : Text(
                          label,
                          style: textStyle?.copyWith(color: whiteColor),
                        ),
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 400),
    ),
  );
}

List<CalculatorButton> buttons = <CalculatorButton>[
  const CalculatorButton('AC', isRedColor: true, canBeFirst: false),
  const CalculatorButton('(', isAmberColor: true),
  const CalculatorButton(')', isAmberColor: true, canBeFirst: false),
  const CalculatorButton('%', isAmberColor: true, canBeFirst: false),
  const CalculatorButton('⌫', isRedColor: true, canBeFirst: false),
  const CalculatorButton('7', isGreyColor: true),
  const CalculatorButton('8', isGreyColor: true),
  const CalculatorButton('9', isGreyColor: true),
  // const CalculatorButton('x²', isAmberColor: true, canBeFirst: false),
  const CalculatorButton('xʸ', isAmberColor: true, canBeFirst: false),
  const CalculatorButton('√x', isAmberColor: true),
  const CalculatorButton('4', isGreyColor: true),
  const CalculatorButton('5', isGreyColor: true),
  const CalculatorButton('6', isGreyColor: true),
  const CalculatorButton(' × ', isAmberColor: true, canBeFirst: false),
  const CalculatorButton(' ÷ ', isAmberColor: true, canBeFirst: false),
  const CalculatorButton('1', isGreyColor: true),
  const CalculatorButton('2', isGreyColor: true),
  const CalculatorButton('3', isGreyColor: true),
  const CalculatorButton(' + ', isAmberColor: true),
  const CalculatorButton(' - ', isAmberColor: true),
  const CalculatorButton('.', isGreyColor: true),
  const CalculatorButton('0', isGreyColor: true),
  const CalculatorButton('π', isGreyColor: true),
  const CalculatorButton('e', isGreyColor: true),
  const CalculatorButton('=', isRedColor: true, canBeFirst: false),
];
