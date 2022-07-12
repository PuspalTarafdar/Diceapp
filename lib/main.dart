// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Center(
            child: Text(
              'Dice Roller',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 10, 116, 14),
              ),
            ),
          ),
          backgroundColor: Colors.yellow,
        ),
        body: Dicepage(),
      ),
    );
  }
}

class Dicepage extends StatefulWidget {
  const Dicepage({Key? key}) : super(key: key);

  @override
  State<Dicepage> createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  int leftdicenumber = 1;
  int rightdicenumber = 1;
  void changediceface() {
    setState(() {
      leftdicenumber = Random().nextInt(6) + 1;
      rightdicenumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 140.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        changediceface();
                      },
                      child: Image.asset('images/dice$leftdicenumber.png')),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        changediceface();
                      },
                      child: Image.asset('images/dice$rightdicenumber.png')),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: FloatingActionButton.extended(
              onPressed: () {
                changediceface();
              },
              label: const Text(
                'ROLL',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              icon: const Icon(Icons.sync_sharp),
              backgroundColor: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}
