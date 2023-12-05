import 'package:adminservice/resources/constant/colors.dart';
import 'package:flutter/material.dart';

class DetailWidget extends StatelessWidget {
  final String label;
  final String label2;

  const DetailWidget({Key? key, required this.label, required this.label2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color:Colors.deepOrange)), 
          Text(label2, style: TextStyle(fontSize: 16, color: Webcolors.white)), 

        ],
      ),
      
    );
  }
}
