

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextField  extends StatelessWidget{
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;
  final IconData? iconLeft;
  final TextInputType keyboardType;
  final bool isValid;
  final bool isEmpty;
  CustomTextField({super.key,required this.controller, required this.labelText, required this.hintText,
      this.errorText, required this.onChanged, this.iconLeft, required this.keyboardType,
      this.isValid= true, this.isEmpty = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label Text (Chữ "Email" nhỏ ở trên)
        if (!isEmpty)
          Text(
            labelText,
            style: TextStyle(
              color: isValid ? Colors.amber : Colors.red,
              fontSize: 12,
            ),
          ),
        const SizedBox(height: 4),
        // TextField
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: iconLeft != null ? Icon(iconLeft) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: isValid ? Colors.amber : Colors.red,
                width: 2.0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1.0,
              ),
            ),
          ),
        ),
        // Error Text (Chữ "Email invalid" màu đỏ bên dưới)
        if (!isValid && !isEmpty && errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
class TestCustomTextField extends StatefulWidget {
  @override
  _TestCustomTextFieldState createState() => _TestCustomTextFieldState();
}

class _TestCustomTextFieldState extends State<TestCustomTextField> {
  final TextEditingController _emailController = TextEditingController();
  bool isValid = false;
  bool isEmpty = true;

  void _handleEmailChange(String value) {
    setState(() {
      isEmpty = value.isEmpty;
      isValid =
          RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$").hasMatch(
              value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom TextField Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomTextField(
          controller: _emailController,
          labelText: "Email",
          hintText: "Enter your email",
          errorText: isValid ? null : "Email invalid",
          onChanged: _handleEmailChange,
          iconLeft: Icons.email,
          keyboardType: TextInputType.emailAddress,
          isValid: isValid,
          isEmpty: isEmpty,
        ),
      ),
    );
  }
}