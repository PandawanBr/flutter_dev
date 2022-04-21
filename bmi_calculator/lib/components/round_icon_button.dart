import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {Key? key, required this.icon, required this.functionOnPress})
      : super(key: key);

  final IconData icon;
  final VoidCallback functionOnPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: functionOnPress,
      child: Icon(icon),
      elevation: 0,
      disabledElevation: 6,
      constraints: const BoxConstraints.tightFor(width: 56, height: 56),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
    );
  }
}
