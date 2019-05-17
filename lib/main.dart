import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePageCached(),
      ),
    ),
  );
}

class DicePageCached extends StatefulWidget {
  @override
  _DicePageCachedState createState() => _DicePageCachedState();
}

class _DicePageCachedState extends State<DicePageCached> {
  var leftDiceNumber = 1;
  var rightDiceNumber = 1;

  void setDiceStates() {
    setState(() {
      leftDiceNumber = Random().nextInt(6 + 1);
      while (leftDiceNumber == 0) {
        leftDiceNumber = Random().nextInt(6);
      }
      rightDiceNumber = Random().nextInt(6 + 1);
      while (rightDiceNumber == 0) {
        rightDiceNumber = Random().nextInt(6);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("LB Pressed");
                setDiceStates();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                print("RB Pressed");
                setDiceStates();
              },
              child: Image.asset('images/dice$rightDiceNumber.png'),
            ),
          ),
        ],
      ),
    );
  }
}
