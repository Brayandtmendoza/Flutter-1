import 'package:flutter/material.dart';

class BtnLight extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnLight({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.black),
      ),
    );
  }
}

class BtnDark extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnDark({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey[200]),
      ),
    );
  }
}

class BtnBlue extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnBlue({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.white)),
      style: ButtonStyle(backgroundColor: WidgetStateProperty.all(Colors.blue)),
    );
  }
}

class BtnRed extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnRed({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.orange),
      ),
    );
  }
}

class BtnYellow extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnYellow({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.yellow),
      ),
    );
  }
}

class BtnSkyblue extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnSkyblue({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.lightBlue),
      ),
    );
  }
}

class BtnGreen extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnGreen({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.white)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.green),
      ),
    );
  }
}

class BtnPurple extends StatelessWidget {
  final String numero;
  final VoidCallback? onPressed;
  const BtnPurple({super.key, required this.numero, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(numero, style: TextStyle(fontSize: 24, color: Colors.black)),
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.grey[300]),
      ),
    );
  }
}
