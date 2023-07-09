import 'package:flutter/material.dart';

class TxtBtn extends StatelessWidget {
  const TxtBtn({
    super.key,
    required this.onP,
    required this.txt,
  });
  final VoidCallback onP;
  final Widget txt;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onP,
      child: txt,
    );
  }
}
