import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Calculadora'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _display = '0';
  double? _firstOperand;
  String? _operator;
  bool _waitingForOperand = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _display = '0';
        _firstOperand = null;
        _operator = null;
        _waitingForOperand = false;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        if (_firstOperand == null) {
          _firstOperand = double.tryParse(_display);
        } else if (_operator != null) {
          _calculate();
        }
        _operator = buttonText;
        _waitingForOperand = true;
      } else if (buttonText == '=') {
        _calculate();
        _operator = null;
        _waitingForOperand = false;
      } else if (buttonText == '.') {
        if (!_display.contains('.')) {
          _display += '.';
        }
      } else {
        // Números
        if (_waitingForOperand) {
          _display = buttonText;
          _waitingForOperand = false;
        } else {
          _display = _display == '0' ? buttonText : _display + buttonText;
        }
      }
    });
  }

  void _calculate() {
    if (_firstOperand != null && _operator != null) {
      double secondOperand = double.tryParse(_display) ?? 0;
      switch (_operator) {
        case '+':
          _display = (_firstOperand! + secondOperand).toString();
          break;
        case '-':
          _display = (_firstOperand! - secondOperand).toString();
          break;
        case '*':
          _display = (_firstOperand! * secondOperand).toString();
          break;
        case '/':
          if (secondOperand != 0) {
            _display = (_firstOperand! / secondOperand).toString();
          } else {
            _display = 'Error';
          }
          break;
      }
      _firstOperand = double.tryParse(_display);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          // Barra de display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            child: Text(
              _display,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
          ),
          // Botones
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: BtnDark(
                        numero: '7',
                        onPressed: () => _buttonPressed('7'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '8',
                        onPressed: () => _buttonPressed('8'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '9',
                        onPressed: () => _buttonPressed('9'),
                      ),
                    ),
                    Expanded(
                      child: BtnRed(
                        numero: '/',
                        onPressed: () => _buttonPressed('/'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: BtnDark(
                        numero: '4',
                        onPressed: () => _buttonPressed('4'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '5',
                        onPressed: () => _buttonPressed('5'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '6',
                        onPressed: () => _buttonPressed('6'),
                      ),
                    ),
                    Expanded(
                      child: BtnRed(
                        numero: '*',
                        onPressed: () => _buttonPressed('*'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: BtnDark(
                        numero: '1',
                        onPressed: () => _buttonPressed('1'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '2',
                        onPressed: () => _buttonPressed('2'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '3',
                        onPressed: () => _buttonPressed('3'),
                      ),
                    ),
                    Expanded(
                      child: BtnRed(
                        numero: '-',
                        onPressed: () => _buttonPressed('-'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: BtnDark(
                        numero: "0",
                        onPressed: () => _buttonPressed('0'),
                      ),
                    ),
                    Expanded(
                      child: BtnDark(
                        numero: '.',
                        onPressed: () => _buttonPressed('.'),
                      ),
                    ),
                    Expanded(
                      child: BtnRed(
                        numero: '=',
                        onPressed: () => _buttonPressed('='),
                      ),
                    ),
                    Expanded(
                      child: BtnRed(
                        numero: '+',
                        onPressed: () => _buttonPressed('+'),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: BtnPurple(
                        numero: 'C',
                        onPressed: () => _buttonPressed('C'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
