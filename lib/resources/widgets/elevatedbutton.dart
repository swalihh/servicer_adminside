import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final bool showloader;

  const CustomElevatedButton({
    super.key,
    required this.onPressed,
    this.buttonText = 'Button',
    required this.showloader,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            fixedSize: Size(screenSize.width, screenSize.height / 16)),
        child:showloader?CircularProgressIndicator() :Text(
          buttonText,
          style: const TextStyle(fontSize: 18),
        ));
  }
}
