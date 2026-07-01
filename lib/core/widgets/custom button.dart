import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.Backgroundcolor,
    required this.textcolor,
    this.borderradius,
    this.ontap,
  });
  final String text;
  final Color Backgroundcolor;
  final Color textcolor;
  final BorderRadius? borderradius;
  final void Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        onPressed: ontap,
        style: TextButton.styleFrom(
          backgroundColor: Backgroundcolor,
          shape: RoundedRectangleBorder(
            borderRadius: borderradius ?? BorderRadius.circular(12),
          ),
        ),
        child: Text(
          text,
          style: Styles.textstyle18.copyWith(
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
