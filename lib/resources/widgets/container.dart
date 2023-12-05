import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;

  const CustomContainer({
    Key? key,
    this.child,
    required this.height,
    required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [BoxShadow(spreadRadius: 5, blurRadius: 10, offset: Offset(0, 5))],
        color: Color.fromARGB(255, 34, 34, 57),
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