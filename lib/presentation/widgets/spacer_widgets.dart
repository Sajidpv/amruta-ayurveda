import 'package:flutter/material.dart';

class Devider extends StatelessWidget {
  const Devider({super.key, this.width, this.height});
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
