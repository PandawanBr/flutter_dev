import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.shade600,
        appBar: AppBar(
          title: const Center(
            child: Text('Ask Me Anything'),
          ),
          backgroundColor: Colors.blue.shade900,
        ),
        body: const AskMeAnythingPage(),
      ),
    ),
  );
}

class AskMeAnythingPage extends StatefulWidget {
  const AskMeAnythingPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AskMeAnything();
}

class _AskMeAnything extends State<AskMeAnythingPage> {
  int randomAnswer = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () =>
                  setState(() => randomAnswer = 1 + Random().nextInt(5)),
              child: Image.asset('images/ball$randomAnswer.png'),
            ),
          ),
        ],
      ),
    );
  }
}
