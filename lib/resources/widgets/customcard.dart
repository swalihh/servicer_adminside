import 'package:flutter/material.dart';

class CustomDetailContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  final Color? color;

  const CustomDetailContainer({
    Key? key,
    this.child,
    required this.height,
    required this.width,
    this.color, // Make color optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color ?? const Color.fromARGB(255, 34, 34, 57), 
      ),
      height: height,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: child,
      ),
    );
  }
}
