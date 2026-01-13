import 'package:flutter/material.dart';
import 'widgets/buttons.dart';

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
  @override
  void dispose() {
    _ctrlDisplay.dispose();
    super.dispose();
  }

  int _counter = 0;
  final TextEditingController _ctrlDisplay = TextEditingController(text: "0");
  double aux1 = 0;
  double aux2 = 0;
  String operacion = "";

  void setAux1() {
    aux1 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void setAux2() {
    aux2 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void calcular() {
    double resultado = 0;
    if (operacion == "+") {
      resultado = aux1 + aux2;
    }
    _ctrlDisplay.text = "${resultado}";
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  double? _firstOperand;
  String? _operator;
  bool _waitingForOperand = false;

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _ctrlDisplay.text = '0';
        _firstOperand = null;
        _operator = null;
        _waitingForOperand = false;
        _counter = 0;
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        if (_firstOperand == null) {
          _firstOperand = double.tryParse(_ctrlDisplay.text);
        } else if (_operator != null) {
          _calculate();
        }
        _operator = buttonText;
        _waitingForOperand = true;
      } else if (buttonText == '=') {
        _calculate();
        _operator = null;
        _waitingForOperand = true;
      } else if (buttonText == '.') {
        if (!_ctrlDisplay.text.contains('.')) {
          _ctrlDisplay.text += '.';
        }
      } else {
        // Números
        if (_waitingForOperand) {
          _ctrlDisplay.text = buttonText;
          _waitingForOperand = false;
        } else {
          _ctrlDisplay.text = _ctrlDisplay.text == '0'
              ? buttonText
              : _ctrlDisplay.text + buttonText;
        }
      }
    });
  }

  void _calculate() {
    if (_firstOperand != null && _operator != null) {
      double secondOperand = double.tryParse(_ctrlDisplay.text) ?? 0;
      switch (_operator) {
        case '+':
          _ctrlDisplay.text = (_firstOperand! + secondOperand).toString();
          break;
        case '-':
          _ctrlDisplay.text = (_firstOperand! - secondOperand).toString();
          break;
        case '*':
          _ctrlDisplay.text = (_firstOperand! * secondOperand).toString();
          break;
        case '/':
          if (secondOperand != 0) {
            _ctrlDisplay.text = (_firstOperand! / secondOperand).toString();
          } else {
            _ctrlDisplay.text = 'Error';
          }
          break;
      }
      _firstOperand = double.tryParse(_ctrlDisplay.text);
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
          // Counter display
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            child: Text(
              'Counter: $_counter',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
          // Barra de display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 12),
            child: TextField(
              controller: _ctrlDisplay,
              readOnly: true,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              decoration: const InputDecoration(border: InputBorder.none),
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
                        numero: '0',
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
                    Expanded(
                      child: BtnGreen(
                        numero: '+',
                        onPressed: _incrementCounter,
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
