import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onTap: () {
                  print('Button pressed!');
                },
                color: Colors.yellowAccent,
                borderRadius: 16.0,
                child: const Text(
                  'Enabled Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              CustomButton(
                enabled: false, // Nút bị disable
                color: Colors.red,
                onTap: () {
                  print("button display");
                },
                child: const Text(
                  'Disabled Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final bool enabled;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;

  const CustomButton({
    Key? key,
    required this.child,
    this.onTap,
    this.enabled = true,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: enabled ? color : Colors.grey,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
        child: Center(child: child),
      ),
    );
  }
}
