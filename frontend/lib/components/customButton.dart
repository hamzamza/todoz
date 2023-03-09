import 'package:flutter/material.dart';

class CustommedButton extends StatelessWidget {
  final Color color;
  final Function press;
  final String text;
  final Color textColor;
  const CustommedButton(
      {super.key,
      required this.color,
      required this.press,
      required this.text,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            onPrimary: Colors.black87,
            primary: color,
            minimumSize: Size(88, 36),
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          ),
          onPressed: () => press(),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
