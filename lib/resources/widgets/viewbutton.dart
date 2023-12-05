import 'package:adminservice/resources/constant/colors.dart';
import 'package:adminservice/resources/constant/fonts.dart';
import 'package:flutter/material.dart';

class ViewElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? text;

  const ViewElevatedButton({
    Key? key,
    this.onPressed,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Webcolors.primaryColor),
      ),
      child: Text(
        text ?? '', // If text is null, use 'Default Text'
        style: AppText.smallDark, // Assuming AppText.smallDark is defined in your code
      ),
    );
  }
}