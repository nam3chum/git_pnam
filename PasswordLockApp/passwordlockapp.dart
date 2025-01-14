import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart'; // Import package
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PasswordLockScreen(),
  ));
}

class PasswordLockScreen extends StatefulWidget {
  const PasswordLockScreen({super.key});

  @override
  PasswordLockScreenState createState() => PasswordLockScreenState();
}

class PasswordLockScreenState extends State<PasswordLockScreen> {
  final List<int> correctPassword = [1, 2, 3, 4];
  List<int> enteredPassword = [];
  List<int> shuffledKeys = [];
  int? pressedKey;

  final FlutterSecureStorage storage =
      const FlutterSecureStorage(); //khoi tao storage để lưu

  @override
  void initState() async {
    super.initState();
    shuffleKeys();
    // đọc mật khẩu đã được luu
    String? password = await getPassword();
    if (password != null) {
      print('đã lưu maajt khẩu $password');
    }
  }

  void shuffleKeys() {
    setState(() {
      shuffledKeys = List.generate(9, (index) => index + 1)..shuffle(Random());
    });
  }

  void savePassword(String password) async {
    await storage.write(key: 'password', value: password);
    print('Password da luu');
  }

  Future<String?> getPassword() async {
    String? password = await storage.read(key: 'password');
    return password;
  }

  // Handle key tap
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
      savePassword(enteredPassword.join());

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SuccessScreen(),
        ),
      );
    } else {
      enteredPassword.clear();
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Incorrect Password'),
          content: const Text('Please try again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Try again'),
            ),
          ],
        ),
      );
    }
  }

  // Delete last entered digit
  void deleteLastDigit() {
    if (enteredPassword.isNotEmpty) {
      setState(() {
        enteredPassword.removeLast();
      });
    }
  }

  // Clear all entered digits
  void clearAllDigits() {
    setState(() {
      enteredPassword.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<int>> rows = [];
    for (int i = 0; i < shuffledKeys.length; i += 3) {
      rows.add(shuffledKeys.sublist(
        i,
        i + 3 > shuffledKeys.length ? shuffledKeys.length : i + 3,
      ));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0e0f1c),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth;
          double maxHeight = constraints.maxHeight;

          double buttonSize = (maxWidth / 3).clamp(0, maxHeight / 8);

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Enter your password',
                  style: TextStyle(color: Color(0xFFc5c5ff), fontSize: 18),
                ),
                SizedBox(height: buttonSize / 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(correctPassword.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF303147),
                          shape: BoxShape.circle,
                          boxShadow: pressedKey != null &&
                                  enteredPassword.length == index
                              ? [
                                  const BoxShadow(
                                    spreadRadius: 8,
                                    color: Color(0xFF303147),
                                  )
                                ]
                              : [],
                        ),
                        child: enteredPassword.length > index
                            ? const Icon(
                                Icons.circle,
                                size: 25,
                                color: Color(0xFFc5c5ff),
                              )
                            : Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFF656687),
                                    width: 1,
                                  ),
                                ),
                              ),
                      ),
                    );
                  }),
                ),
                SizedBox(height: buttonSize / 4),
                Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: rows.map((row) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: row.map((key) {
                            return GestureDetector(
                              onTapDown: (_) {
                                setState(() {
                                  pressedKey = key;
                                });
                              },
                              onTap: () {
                                setState(() {
                                  pressedKey = null;
                                  onKeyTap(key);
                                });
                              },
                              onTapCancel: () {
                                setState(() {
                                  pressedKey = null;
                                });
                              },
                              child: Container(
                                width: buttonSize,
                                height: buttonSize,
                                margin: const EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: pressedKey == key
                                      ? [
                                          const BoxShadow(
                                            color: Color(0xFF261748),
                                          )
                                        ]
                                      : [],
                                ),
                                child: Center(
                                  child: Text(
                                    key.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFFc5c5ff),
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: buttonSize,
                          width: buttonSize,
                          margin: const EdgeInsets.all(5),
                          child: IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Color(0xFFc5c5ff),
                              size: 30,
                            ),
                            padding: const EdgeInsets.all(20),
                            onPressed: clearAllDigits,
                            highlightColor: const Color(0xFF261748),
                          ),
                        ),
                        GestureDetector(
                          onTapDown: (_) {
                            setState(() {
                              pressedKey = 0;
                            });
                          },
                          onTapUp: (_) {
                            setState(() {
                              pressedKey = null;
                            });
                          },
                          onTap: () => onKeyTap(0),
                          child: Container(
                            margin: const EdgeInsets.all(5),
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            width: buttonSize,
                            height: buttonSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: pressedKey == 0
                                  ? [
                                      const BoxShadow(
                                        color: Color(0xFF261748),
                                        spreadRadius: 10,
                                      )
                                    ]
                                  : [],
                            ),
                            child: const Text(
                              "0",
                              style: TextStyle(
                                color: Color(0xFFc5c5ff),
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: buttonSize,
                          width: buttonSize,
                          margin: const EdgeInsets.all(5),
                          child: IconButton(
                            icon: const Icon(Icons.backspace,
                                color: Color(0xFFc5c5ff)),
                            onPressed: deleteLastDigit,
                            highlightColor: const Color(0xFF261748),
                            padding: const EdgeInsets.all(20),
                            style: const ButtonStyle(),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
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
