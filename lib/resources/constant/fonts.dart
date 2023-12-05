import 'package:adminservice/resources/constant/colors.dart';
import 'package:flutter/material.dart';

class AppText {
  static TextStyle get xSmall => const TextStyle(
        fontSize: 11.5,
        fontWeight: FontWeight.w500,
        fontFamily: 'Poppins',
        color:  Color.fromARGB(255, 254, 254, 254),
      );
  static TextStyle get smallDark => const TextStyle(
        fontSize: 14,
        color: Webcolors.white,
      );
 
}