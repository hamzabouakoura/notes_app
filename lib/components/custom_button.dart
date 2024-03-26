import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.ontap,
      required this.color,
      this.txtcolor,
      this.isLoading = false});
  final String text;
  final VoidCallback? ontap;
  final Color color;
  final Color? txtcolor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    text,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: txtcolor,
                    ),
                  )),
      ),
    );
  }
}
