import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool obscureText;

  const LoginTextField({
    Key? key,
    required this.labelText,
    this.controller,
    this.validator,
    this.obscureText = false, // Set a default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      style: TextStyle(color: Colors.white), // Set text color to white
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: const Color.fromARGB(255, 64, 65, 86),
        labelStyle: TextStyle(color: Colors.white), // Set label color to white
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        suffixIcon: controller != null
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: controller!.text.isNotEmpty
                      ? Colors.white
                      : Colors.grey,
                ),
                onPressed: controller!.text.isNotEmpty
                    ? () {
                        controller!.clear();
                      }
                    : null,
              )
            : null,
      ),
    );
  }
}
