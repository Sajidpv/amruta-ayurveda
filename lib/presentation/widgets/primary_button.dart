import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
  });
  final Color? color;
  final Color? textColor;
  final String label;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor:
                  color != null ? color : Color.fromRGBO(0, 104, 55, 1.000),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)))),
          child: Text(
            label,
            style: TextStyle(
                color: textColor != null ? textColor : Colors.white,
                fontSize: 12),
          )),
    );
  }
}
