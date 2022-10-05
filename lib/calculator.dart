import 'package:calculator/calculator_equations.dart';
import 'package:calculator/board_buttons.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: size.width,
              // height: size.height / 2.35,

              padding: EdgeInsets.symmetric(
                vertical: size.width * 0.08,
                horizontal: size.width * 0.06,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20.0,
                    child: ListView(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Consumer<CalculatorEquations>(
                          builder: (context, equation, child) => Text(
                            equation.equation,
                            // style: Theme.of(context).textTheme.caption,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Consumer<CalculatorEquations>(
                    builder: (context, equation, child) => Text(
                      equation.result,
                      // style: Theme.of(context).textTheme.headline3,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // width: double.infinity,
              width: size.width,
              height: size.width * 0.77,
              color: buttonsBackgroundColor,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(15.0),
                crossAxisSpacing: 5,
                childAspectRatio: 1.3,
                mainAxisSpacing: 5.0,
                crossAxisCount: 5,
                children: buttons,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
