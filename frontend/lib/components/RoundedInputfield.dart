import 'package:flutter/material.dart';
import 'TextFieldContainer.dart';

class RoundedInputField extends StatelessWidget {
  final String hinttxt;
  final Color color;
  final Function fun;
  final Color textcolor;
  final Icon icon;
  const RoundedInputField(
      {super.key,
      required this.hinttxt,
      required this.color,
      required this.fun,
      required this.textcolor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
      onChanged: (value) {
        fun(value);
      },
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: hinttxt,
        icon: icon,
        border: InputBorder.none,
      ),
    ));
  }
}

class RoundedSecretInputField extends StatelessWidget {
  final String hinttxt;
  final Color color;
  final Function fun;
  final Color textcolor;
  final Icon icon;
  const RoundedSecretInputField(
      {super.key,
      required this.hinttxt,
      required this.color,
      required this.fun,
      required this.textcolor,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
        child: TextField(
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1),
      onChanged: (value) {
        fun(value);
      },
      obscureText: true,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black26),
        hintText: hinttxt,
        icon: icon,
        border: InputBorder.none,
      ),
    ));
  }
}
