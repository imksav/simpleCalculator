import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_calculator/widgets/calc_button.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalcApp());

class CalcApp extends StatefulWidget {
  @override
  _CalcAppState createState() => _CalcAppState();
}

class _CalcAppState extends State<CalcApp> {
  String expression = "";
  String result = "0";
  String equation = "0";

  String numClick(String text) {
    setState(() {
      if (equation == "0") {
        equation = text;
      } else {
        equation += text;
      }
    });
    return equation;
  }

  void clearAll(String text) {
    setState(() {
      equation = "0";
      result = "0";
    });
  }

  void clear(String text) {
    setState(() {
      equation = "0";
    });
  }

  void cut(String text) {
    setState(() {
      equation = equation.substring(0, equation.length - 1);
    });
  }

  void operation(String text) {
    if (text == "=") {
      expression = equation;
      expression = expression.replaceAll("x", "*");
      expression = expression.replaceAll("÷", "/");
      try {
        Parser p = Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        result = (exp.evaluate(EvaluationType.REAL, cm)).toString();
        setState(() {
          result = (exp.evaluate(EvaluationType.REAL, cm)).toString();
        });
      } catch (e) {
        result = "Error";
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Simple Calculator",
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text("Simple Calculator"),
        //   centerTitle: true,
        // ),
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 10, left: 5, right: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "$equation",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 45,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "$result",
                    style: GoogleFonts.rubik(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  alignment: Alignment(1, 1),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "AC",
                      callback: clearAll,
                      // textSize: 28,
                      fillColor: 0xFFFF0000,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "C",
                      callback: clear,
                      fillColor: 0x90EE0200,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "⌫",
                      callback: cut,
                      textSize: 24,
                      fillColor: 0xFF42A5F5,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "÷",
                      callback: numClick,
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF6C807F,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "7",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "8",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "9",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "x",
                      callback: numClick,
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF6C807F,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "4",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "5",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "6",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "-",
                      callback: numClick,
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF6C807F,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: "1",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "2",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "3",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "+",
                      callback: numClick,
                      fillColor: 0xFFFFFFFF,
                      textColor: 0xFF6C807F,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CalcButton(
                      text: ".",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "0",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "00",
                      callback: numClick,
                      fillColor: 0xEE0290,
                      textColor: 0xFFFFFFFF,
                    ),
                    CalcButton(
                      text: "=",
                      callback: operation,
                      fillColor: 0xFF8BC34A,
                      textColor: 0xFFFFFFFF,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
