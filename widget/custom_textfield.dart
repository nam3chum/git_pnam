import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;
  final IconData? iconLeft;
  final TextInputType? keyboardType;
  final bool isValid;
  final bool isEmpty;
  final bool isPassword;
  final double height, width;
  final int maxLength;

  const CustomTextField({
    super.key,
    this.isPassword = false,
    this.maxLength = 100,
    this.height = 50,
    this.width = 250,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.errorText,
    required this.onChanged,
    this.iconLeft,
    this.keyboardType,
    this.isValid = true,
    this.isEmpty = true,
  });

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true; // Trạng thái hiển thị mật khẩu (ẩn mặc định)
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Label Text (Chữ "Email" nhỏ ở trên)
          Padding(padding: const EdgeInsets.only(left: 20),child:Text(
            widget.labelText,
            style: TextStyle(
              color: widget.isValid ? Colors.amber : Colors.red,
              fontSize: 12,
            ),
          ),),
        // TextField
        Container(
          height: widget.height,
          padding: const EdgeInsets.only(left: 30),
          width: widget.width,
          decoration: const BoxDecoration(
            color: Color(0xFFDCDCDC),
            borderRadius: BorderRadius.all(Radius.circular(45)),
          ),
          child: Align(
            alignment: Alignment.center,
            child: TextField(
              maxLength: widget.maxLength,
              //giới hạn độ dài của textfield
              showCursor: true,
              cursorColor: Colors.amber,
              buildCounter: (_,
                      {required currentLength,
                      required isFocused,
                      maxLength}) =>
                  null,
              // Tắt bộ đếm
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              onChanged: widget.onChanged,
              style: const TextStyle(
                  fontSize: 20, fontFamily: 'Roboto', color: Color(0xFF515151)),
              obscureText: widget.isPassword ? _obscureText : false,
              // Chỉ ẩn khi là mật khẩu
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed:
                            _togglePasswordVisibility, // Toggle trạng thái ẩn/hiện mật khẩu
                      )
                    : (widget.iconLeft != null ? Icon(widget.iconLeft) : null),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        // Error Text (Chữ "Email invalid" màu đỏ bên dưới)
        if (!widget.isValid && !widget.isEmpty && widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              widget.errorText!,
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
