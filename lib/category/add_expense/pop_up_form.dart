
import 'package:flutter/material.dart';



class PopUpForm extends StatelessWidget {
  final TextEditingController controller;
  final bool readOnly;
  final String text;
  final VoidCallback ontap;
  final Color selectedColor;
  const PopUpForm({
    super.key,
    required this.controller,
    required this.readOnly,
    required this.text,
    required this.ontap, required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: ontap,
      controller: controller,
      readOnly: readOnly,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
          hintText: text,
          fillColor: selectedColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15))),
    );
  }
}
