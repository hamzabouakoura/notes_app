import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.onChanged,
      this.controller,
      this.obscureText = false,
      this.maxLines = 1,
      this.initialValue});
  final String hint;
  final Function(String value)? onChanged;
  final TextEditingController? controller;
  final bool obscureText;
  final int maxLines;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      maxLines: maxLines,
      obscureText: obscureText,
      controller: controller,
      validator: (data) {
        if (data!.isEmpty) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.lightBlue.shade300,
          ),
        ),
      ),
    );
  }
}
