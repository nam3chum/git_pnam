
import 'package:flutter/material.dart';

class TestCustomTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Demo"),
        ),
        body: GestureDetector(
          child: Container(
            height: 50,
            width: 250,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(24.0),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.facebook,color: Colors.blue,), // Icon ở đầu
                SizedBox(width: 8.0),
                Text("Continue with google"), // Nút chính
                SizedBox(width: 8.0),
                Icon(Icons.arrow_right_alt), // Icon ở cuối
              ],
            ),
          ),

        ));
  }
}