import 'package:flutter/material.dart';

class MyCircularButton extends StatelessWidget {
  final Widget buttonChild;
  final Color btnColor;
  final Function() onPress;

  MyCircularButton(
      {required this.buttonChild,
      required this.btnColor,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width / 4,
      height: MediaQuery.of(context).size.width / 4,
      child: ElevatedButton(
        onPressed: onPress,
        child: buttonChild,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const CircleBorder()),
          padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          backgroundColor: MaterialStateProperty.all(btnColor),
        ),
      ),
    );
  }
}
