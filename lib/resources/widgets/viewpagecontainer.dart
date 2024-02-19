import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:flutter/material.dart';

class CustomViewTextField extends StatelessWidget {
  final String labelText;
  final int? maxLength;
  final int? minLength;
  final int? maxLines;
  final TextEditingController? controller;
  final IconData? prefixIcon;
  const CustomViewTextField({
    Key? key,
    required this.labelText,

    this.maxLength,
    this.minLength,
    this.maxLines,
    this.controller,
    this.prefixIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: AppText.smallDark, 
        ),
        TextFormField(
          readOnly: true,
          maxLines: maxLines,
          maxLength: maxLength,
          controller: controller,
          style: const TextStyle(color: Webcolors.white),
          decoration: InputDecoration(
            prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Webcolors.white) : null,
            fillColor: Webcolors.accentCanvasColor,
            filled: true,
          ),
        ),
      ],
    );
  }
}
 