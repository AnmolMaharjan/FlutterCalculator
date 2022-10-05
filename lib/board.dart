import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String calcText = "", numb = "", answer = "";
  List number = [];
  List operator = [];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: 10,
            color: Colors.blue,
          ),
          Container(
            height: 20,
            color: Colors.red,
          ),
        ],
      ),
    ));
  }

  Widget calculatorButton(String text, [Color? color]) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        output(text);
      },
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          // height: 60,
          height: size.height / 13,
          // width: 60,
          width: size.height / 13,
          decoration: BoxDecoration(
              color: color ?? Colors.grey[700],
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  output(String text) {
    if (text == "AC") {
      setState(() {
        calcText = "";
        numb = "";
        answer = "";
        count = 0;
        number = [];
        operator = [];
      });
    } else if (text == "=") {
      setState(() {
        RegExp exp = RegExp(r'(\w+)');
        Iterable<RegExpMatch> matches = exp.allMatches(calcText);
        for (final m in matches) {
          debugPrint(m[0]);
        }
        answer = calcText;
        calcText = "$count";
      });
    } else {
      setState(() {
        calcText += text;
      });
    }
  }
}
