import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: createExpandedList(),
          ),
        ),
      ),
    );
  }

  void playsound(final int noteNumber) {
    final player = AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded buildKey(Color color, int soundNumber) {
    return Expanded(
      child: Container(
        color: color,
        width: double.infinity,
        child: TextButton(
          onPressed: () => playsound(soundNumber),
          child: const Text(''),
        ),
      ),
    );
  }

  List<Expanded> createExpandedList() {
    List<Expanded> expandedList = List<Expanded>.empty(growable: true);
    final colorsList = [
      Colors.red,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.teal,
      Colors.blue,
      Colors.purple
    ];
    colorsList.forEach((element) =>
        expandedList.add(buildKey(element, (colorsList.indexOf(element) + 1))));
    return expandedList;
  }
}
