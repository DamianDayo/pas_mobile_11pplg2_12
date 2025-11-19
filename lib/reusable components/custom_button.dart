import 'package:flutter/material.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? backgroundcolor;
  final Color? textcolor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundcolor,
    this.textcolor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundcolor ?? AppColor.primaryblue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textcolor ?? AppColor.neutrallight),
        ),
      ),
    );
  }
}