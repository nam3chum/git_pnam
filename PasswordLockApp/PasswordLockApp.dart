import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false, //tat debug mode banner
    home: PasswordLockScreen(),
  ));
}

class PasswordLockApp extends StatelessWidget {
  const PasswordLockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //tat debug mode banner
      home: PasswordLockScreen(),
    );
  }
}

class PasswordLockScreen extends StatefulWidget {
  const PasswordLockScreen({super.key});

  @override
  _PasswordLockScreenState createState() => _PasswordLockScreenState();
}

class _PasswordLockScreenState extends State<PasswordLockScreen> {
  final List<int> correctPassword = [1, 2, 3, 4];
  List<int> enteredPassword = [];
  List<int> shuffledKeys = [];
  @override
  void initState() {
    super.initState();
    shuffleKeys();
  }

  void shuffleKeys() {
    setState(() {
      shuffledKeys = List.generate(9, (index) => index + 1)..shuffle(Random());
    });
  }

  void onKeyTap(int key) {
    if (enteredPassword.length < correctPassword.length) {
      setState(() {
        enteredPassword.add(key);
      });
      if (enteredPassword.length == correctPassword.length) {
        checkPassword();
      }
    }
  }

  void checkPassword() {
    if (enteredPassword.join() == correctPassword.join()) {
      enteredPassword.clear();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        )
      );
    } else {
      // Reset mat khau
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Incorrect Password'),
          content: const Text('Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  enteredPassword.clear();
                });
              },
              child: const Text('thử lại'),
            ),
          ],
        ),
      );
    }
  }
  void deleteLastDigit() {
    if (enteredPassword.isNotEmpty) {
      setState(() {
        enteredPassword.removeLast();
      });
    }
  }

  void clearAllDigits() {
    setState(() {
      enteredPassword.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter your password',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 20),
          // Password indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(correctPassword.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  enteredPassword.length > index
                      ? Icons.circle
                      : Icons.circle_outlined,
                  color: Colors.white,
                ),
              );
            }),
          ),
          const SizedBox(height: 20),
          // Number pad
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
            ),
            itemCount: shuffledKeys.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final key = shuffledKeys[index];
              return GestureDetector(
                onTapUp: (_) {
                  setState(() {
                    // Remove highlight when released
                    pressedKey = null;
                    onKeyTap(key);
                  });
                },
                onTapCancel: () {
                  setState(() {
                    // Remove highlight if the tap is canceled
                    pressedKey = null;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle),
                  child: Center(
                    child: Text(
                      key.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          // Action buttons
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.cancel,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: clearAllDigits,
              ),
              GestureDetector(
                onTap: () => onKeyTap(0),
                child: Center(
                  child: Text(
                    0.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.backspace, color: Colors.white),
                onPressed: deleteLastDigit,
              ),
            ],
          ),
        ],
      ),
    );
  }

  int? pressedKey;
}

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.white, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Password Correct!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
