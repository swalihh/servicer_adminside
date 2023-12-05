import 'package:flutter/material.dart';

class TextFieldSpacing extends StatelessWidget {
  const TextFieldSpacing({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
    height: screenSize.height / 55,
    );
  }



}


class TextFieldSpacingWidth extends StatelessWidget {
  const TextFieldSpacingWidth({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
    height: screenSize.width / 55,
    );
  }


  
}