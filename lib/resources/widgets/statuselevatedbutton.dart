import 'package:adminservice/resources/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color? textColor;
  final Widget icon;
  final String label;

  const CustomIconButton({
    Key? key,
    this.onPressed,
    this.textColor,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        var screenSize = MediaQuery.of(context).size;

    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: textColor, 
        minimumSize: Size(screenSize.width*0.2-20,screenSize.height*0.02+30), 
      ),
      icon: icon,
      label: Text(
        label,
        style: const TextStyle(color:Webcolors.white), 
      ),
    );
  }
}
