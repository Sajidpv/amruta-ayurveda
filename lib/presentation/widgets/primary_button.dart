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

SizedBox circularButton({
  required BuildContext context,
  required IconData icon,
  dynamic arguments,
  required VoidCallback onClick,
}) {
  Color color = Theme.of(context).colorScheme.primary;
  return SizedBox(
    width: 56,
    height: 56,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: color,
            padding: EdgeInsets.all(15),
          ),
          child: Center(
            child: Icon(
              icon,
              color: Colors.white,
              size: 20,
            ),
          ),
        ),
      ],
    ),
  );
}
