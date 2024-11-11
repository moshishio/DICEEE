import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Mga dice ni Woshi||CPE32-GONZALES'),
          backgroundColor: Colors.black12,
        ),
        body: Dicepage(),
      ),
    ),
  );
}

class Dicepage extends StatefulWidget {
  const Dicepage({super.key});

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int left = 1, right = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$left.png'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        ChangeValue();
                      });
                    },
                    child: Image.asset('images/dice$right.png'),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Left Dice: $left',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            'Right Dice: $right',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            'Total: ${left + right}',
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            _getHigherDiceMessage(),
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ],
      ),
    );
  }

  void ChangeValue() {
    left = 1 + Random().nextInt(6);
    right = 1 + Random().nextInt(6);
  }

  String _getHigherDiceMessage() {
    if (left > right) {
      return 'The left dice is higher!';
    } else if (right > left) {
      return 'The right dice is higher!';
    } else {
      return 'Both dice are equal!';
    }
  }
}