import 'package:flutter/material.dart';

class numberBox extends StatelessWidget {
  numberBox({
    super.key,
    required this.text,
    this.height = 30,
    this.width = 50,
  });
  final String text;
  double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        height: height,
        width: width,
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
