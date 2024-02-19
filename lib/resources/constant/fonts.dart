import 'package:adminservice/resources/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

       static TextStyle get appname =>  GoogleFonts.silkscreen(
        fontSize: 50,
        fontWeight: FontWeight.w500,
        
        color: Colors.white,
        
      );

      
       static TextStyle get hometittle =>  GoogleFonts.silkscreen(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        
        color: Colors.white,
        
      );
 
}