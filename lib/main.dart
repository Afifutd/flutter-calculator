import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'presentation/calculator_ui.dart';

void main() {
  runApp(const CalculatorAppState());
}

class CalculatorAppState extends StatefulWidget {
  const CalculatorAppState({super.key});

  @override
  State<CalculatorAppState> createState() => _CalculatorAppStateState();
}

class _CalculatorAppStateState extends State<CalculatorAppState> {
  // This widget is the root of your application.

  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
          backgroundColor: Color(0xff28527a),
          appBar: AppBar(
            title: Center(
                child: Text(
              "Flutter Calculator",
              style: TextStyle(color: Colors.white),
            )),
            backgroundColor: Colors.blueGrey,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Text(
                  _history,
                  style: TextStyle(
                    color: Color(0x66FFFFFF),
                    fontSize: 24,
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  _expression,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorUi(
                    text: "AC",
                    textSize: 20,
                    fillColor: Color(0xff8ac4d0),
                    callback: allClear,
                  ),
                  CalculatorUi(
                    text: "C",
                    textSize: 20,
                    fillColor: Color(0xff8ac4d0),
                    callback: clear,
                  ),
                  CalculatorUi(
                    text: "<",
                    textSize: 20,
                    fillColor: Color(0xfff4d160),
                    callback: clear,
                  ),
                  CalculatorUi(
                      callback: numClick,
                      text: "/",
                      textSize: 20,
                      fillColor: Color(0xfff4d160)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorUi(
                    text: "6",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "5",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "4",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                      callback: numClick,
                      text: "-",
                      textSize: 20,
                      fillColor: Color(0xfff4d160)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorUi(
                    text: "3",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "2",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "1",
                    textSize: 20,
                    callback: numClick,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                      callback: numClick,
                      text: "+",
                      textSize: 20,
                      fillColor: Color(0xfff4d160)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CalculatorUi(
                    callback: numClick,
                    text: "+/-",
                    textSize: 20,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                    fillColor: Color(0xff8ac4d0),
                  ),
                  CalculatorUi(
                      callback: evaluate,
                      text: "=",
                      textSize: 20,
                      fillColor: Color(0xfff4d160)),
                ],
              ),
            ],
          )),
    );
  }
}
