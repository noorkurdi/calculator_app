import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CircleBtn extends StatelessWidget {
  const CircleBtn({
    super.key,
    required this.numBtn,
    required this.onP,
    required this.btnColor,
    required this.txtColor,
    required this.borderRadius,
  });
  final Widget numBtn;
  final VoidCallback onP;
  final Color btnColor;
  final Color txtColor;
  final BorderRadius borderRadius;

  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(500000),
      onTap: onP,
      child: CircleAvatar(
        backgroundColor: btnColor,
        foregroundColor: txtColor,

        // style: ButtonStyle(
        //   backgroundColor: MaterialStateProperty.all(btnColor),
        //   foregroundColor: MaterialStateProperty.all(txtColor),
        //   shape: MaterialStateProperty.all(
        //     RoundedRectangleBorder(
        //       borderRadius: borderRadius,
        //     ),
        //   ),
        //   elevation: const MaterialStatePropertyAll(8),
        //   shadowColor: MaterialStateProperty.all(txtColor),
        // ),
        child: numBtn,
      ),
    );
  }
}
