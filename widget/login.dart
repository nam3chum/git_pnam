import 'package:flutter/material.dart';
import 'package:swapify/ui/widget/register.dart';
import 'package:swapify/ui/widget/custom_button.dart';
import 'package:swapify/ui/widget/custom_textfield.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isMailValid = true, isPassValid = true;
  bool isMailEmpty = false, isPassEmpty = false;

  void _handleEmailChange(String value) {
    setState(() {
      isMailEmpty = value.isEmpty;
      isMailValid = RegExp(r"^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$")
          .hasMatch(value);
    });
  }

  void _handlePasswordChange(String value) {
    setState(() {
      isPassEmpty = value.isEmpty;
      String pattern = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$';
      isPassValid = RegExp(pattern).hasMatch(value);
    });
  }

  bool formValidate() {
    return isMailValid && isPassValid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFB900),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ));
                },
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ))
          ],
        ),
      ),
      backgroundColor: const Color(0xFFFFB900),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 6,
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, top: 50),
                    child: Text("Sign Up",
                        style: TextStyle(
                            fontSize: 55,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto')),
                  ),
                ],
              )),
          Container(
              height: MediaQuery.of(context).size.height / 2.3,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextField(
                            height: 60,
                            width: 350,
                            controller: _emailController,
                            iconLeft: Icons.email_outlined,
                            labelText: 'Email',
                            hintText: 'email',
                            errorText: 'Email invalid',
                            isValid: isMailValid,
                            isEmpty: isMailEmpty,
                            onChanged: _handleEmailChange,
                            //    keyboardType: TextInputType.emailAddress
                          ),
                          CustomTextField(
                            height: 60,
                            width: 350,
                            controller: _passwordController,
                            labelText: 'password',
                            hintText: 'password',
                            errorText: 'password invalid',
                            isValid: isPassValid,
                            isEmpty: isPassEmpty,
                            onChanged: _handlePasswordChange,
                            iconLeft: Icons.visibility_off,
                            isPassword: true,
                            //    keyboardType: TextInputType.text
                          ),
                          const Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Forgot password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: '.VnArialH'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                     CustomButton(
                      borderRadius: 45,
                      height: 65,
                      width: 350,
                      color: const Color(0xFFFFB900),
                      enabled: formValidate(),
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: '.VnArialH'),
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
              child: Container(
                  color: const Color(0xFFDCDCDC),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        height: 60,
                        width: 350,
                        color: Colors.white,
                        borderRadius: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 35,
                              child: OverflowBox(
                                maxWidth: 200,
                                maxHeight: 200,
                                child: Image.asset(
                                  'assets/google.png',
                                  width: 35,
                                  height: 35,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            // Icon ở đầu
                            const SizedBox(width: 8.0),
                            const Text("Continue with google",
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                            // Nút chính
                            const SizedBox(width: 8.0),
                            const Icon(
                              Icons.arrow_right_alt,
                              size: 35,
                            ),
                            // Icon ở cuối
                          ],
                        ),
                      ),
                      const CustomButton(
                        height: 60,
                        width: 350,
                        color: Colors.white,
                        borderRadius: 45,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.facebook,
                              color: Colors.blue,
                              size: 35,
                            ),
                            // Icon ở đầu
                            SizedBox(width: 8.0),
                            Text(
                              "Continue with Facebook",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                            // Nút chính
                            SizedBox(width: 8.0),
                            Icon(
                              Icons.arrow_right_alt,
                              size: 35,
                            ),
                            // Icon ở cuối
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
