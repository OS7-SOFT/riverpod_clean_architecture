import 'package:flutter/material.dart';

class IndicatorLoading extends StatelessWidget {
  final Color shapeColor;
  final Color textColor;
  const IndicatorLoading(
      {super.key, required this.shapeColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          color: Colors.blue,
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          "Please wait",
          style: TextStyle(fontSize: 17, color: textColor),
        )
      ],
    );
  }
}
