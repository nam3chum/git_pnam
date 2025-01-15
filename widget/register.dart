import 'dart:io';

import 'package:flutter/material.dart';
import 'package:swapify/ui/widget/bottomSheet.dart';
import 'package:swapify/ui/widget/custom_button.dart';
import 'package:swapify/ui/widget/custom_textfield.dart';

void main() {
  runApp(const MaterialApp(
    home: Register(),
  ));
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isValid = false;
  bool isEmpty = true;
  bool isChecked = false;
  bool isPasswordObscured = true;
  bool isConfirmPasswordObscured = true;
  File? _selectedImage;

  void _handleEmailChange(String value) {
    setState(() {
      isEmpty = value.isEmpty;
      isValid = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
          .hasMatch(value);
    });
  }

  void _handleUsernameChange(String value) {
    setState(() {});
  }

  void _handlePhoneNumber(String phoneNum) {
    setState(() {
      isEmpty = phoneNum.isEmpty;
    });
  }

  void _showCustomBottomSheet() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(45)),
        ),
        builder: (context) {
          return BottomSheetCustom(
            onImageSelected: (File? image) {
              setState(() {
                _selectedImage = image;
              });
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFFFB900),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFFFB900),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(
                Icons.arrow_back_sharp,
                size: 25,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            const Text(
              "Register",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextField(
                  controller: phoneController,
                  labelText: '',
                  hintText: 'Phone Number',
                  onChanged: _handlePhoneNumber,
                  height: 60,
                  width: 250,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  iconLeft: Icons.phone_android_outlined,
                ),
                if (_selectedImage == null)
                    IconButton(
                        icon: const Icon(
                          Icons.add_photo_alternate_outlined,
                          color: Color(0xFFFFB900),
                          size: 70,
                        ),
                        onPressed: _showCustomBottomSheet)
                else
                    GestureDetector(
                      onTap: _showCustomBottomSheet,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(55),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0xffFFB900),
                              blurStyle: BlurStyle.outer,
                              spreadRadius: 5
                            )
                          ]
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.file(
                            _selectedImage!,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        )
                      ),
                    )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: emailController,
              labelText: 'Email',
              hintText: 'Email',
              onChanged: _handleEmailChange,
              width: 350,
              height: 70,
              errorText: 'Email invalid',
              iconLeft: Icons.email_outlined,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: usernameController,
              labelText: '',
              hintText: 'User Name',
              onChanged: _handleUsernameChange,
              width: 350,
              height: 70,
              errorText: 'Username invalid',
              iconLeft: Icons.person,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: passwordController,
              labelText: 'Password',
              hintText: 'Password',
              onChanged: _handleEmailChange,
              width: 350,
              height: 70,
              errorText: 'Password invalid',
              iconLeft: Icons.visibility_off,
              isPassword: true,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              controller: confirmPasswordController,
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
              onChanged: _handleEmailChange,
              width: 350,
              height: 70,
              errorText: 'Password mismatch',
              iconLeft: Icons.remove_red_eye_sharp,
              isPassword: true,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value ?? false;
                    });
                  },
                  shape: const RoundedRectangleBorder(
                      side: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(4))),
                ),
                const Text(
                  'I agree to ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const Text(
                  'the term of use',
                  style: TextStyle(
                      color: Colors.amber, fontWeight: FontWeight.bold),
                )
              ],
            ),
            CustomButton(
              borderRadius: 45,
              color: Colors.amber,
              height: 55,
              enabled: isChecked ? true : false,
              child: const Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
