import 'package:adminservice/models/servicermodel.dart';
import 'package:adminservice/view/view.dart';
import 'package:flutter/material.dart';

class WebAlertbox {
  
}
 showViewAlertDialog(BuildContext context,ServicerModel servicer) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(0, 0, 0, 0),
              content: Builder(
                builder: (BuildContext context) {
                  return Views(servicer: servicer ,); 
                },
              ));
        });
  }