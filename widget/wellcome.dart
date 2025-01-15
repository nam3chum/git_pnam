import 'package:flutter/material.dart';
import 'package:swapify/ui/widget/custom_button.dart';
import 'package:swapify/ui/widget/login.dart';
import 'package:swapify/ui/widget/register.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Wellcome(),
  ));
}

class Wellcome extends StatefulWidget {
  const Wellcome({super.key});

  @override
  State<Wellcome> createState() => _WellcomeState();
}

class _WellcomeState extends State<Wellcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFB900),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2,
            color: Colors.blue.withOpacity(0.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  alignment: Alignment.center,
                  width: 230,
                  height: 230,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80)),
                      color: Color(0xFFFFD76D)),
                  child: const Text(
                    "Wellcome \n to Flutter",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),maxLines: 2,
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 300,
              width: 350,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  borderRadius:
                      BorderRadius.only(topRight: Radius.circular(80)),
                  color: Color(0xFFFFD76D)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login(),)
                      );
                    },
                    color: const Color(0xFFFFB900),
                    height: 65,
                    borderRadius: 30,
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   CustomButton(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register(),)
                      );
                    },
                    color: const Color(0xFFFFB900),
                    borderRadius: 30,
                    height: 65,
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
