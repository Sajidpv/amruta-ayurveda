import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  const DefaultTextFormField({
    super.key,
    required this.textController,
    this.validator,
    this.label,
    this.textInputType,
    this.onChanged,
    this.readOnly = false,
    this.suffix,
    this.onTap,
    this.textInputAction = TextInputAction.next,
  });

  final TextEditingController textController;
  final String? Function(String?)? validator;
  final Function? onChanged, onTap;
  final String? label;
  final TextInputType? textInputType;
  final bool readOnly;
  final IconData? suffix;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () {
        textController.selection = TextSelection(
          baseOffset: 0,
          extentOffset: textController.text.length,
        );
        onTap?.call();
      },
      validator: validator,
      readOnly: readOnly,
      textInputAction: textInputAction,
      keyboardType: textInputType ?? null,
      controller: textController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: const TextStyle(fontSize: 10, height: .5),
      onChanged: (value) {
        onChanged;
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey.shade300,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          hintText: label != null
              ? readOnly
                  ? label
                  : 'Enter your ${label}'
              : null,
          suffix: suffix == null ? null : Icon(suffix),
          suffixIconColor: Color.fromRGBO(0, 104, 55, 1.000)),
    );
  }
}
