import 'package:calculator/calculator_equations.dart';
import 'package:calculator/calculator.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(const Calc());
}

class Calc extends StatelessWidget {
  const Calc({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorEquations>(
      create: (_) => CalculatorEquations(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const Calculator(),
        },
      ),
    );
  }
}
