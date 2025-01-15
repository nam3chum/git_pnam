import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyAppState();
  }
}
class MyAppState extends State<MyApp>{
  bool isEnable = true;
  Color color = Colors.orange;
  //BoxDecoration _boxDecoration = const BoxDecoration();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  void _toggle(){
    setState(() {
      isEnable = !isEnable;
      if(isEnable== false)
      {
        color = Colors.grey;
        print('button is disabled');
      }
      else{
        color = Colors.orange;
        print('button is enabled');
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                height: 50,
                width: 250,
                onTap:_toggle,
                color: color,
                enabled: isEnable,
                borderRadius: 16.0,
                child: const Text(
                  'Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              const CustomButton(
                color: Colors.white,
                borderRadius: 25,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.facebook,color: Colors.blue,), // Icon ở đầu
                    SizedBox(width: 8.0),
                    Text("Continue with google"), // Nút chính
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_right_alt), // Icon ở cuối
                  ],
                ),
              )
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
  final IconData? iconLeft;
  final IconData? iconRight;
  final double height, width;
  const CustomButton({
    Key? key,
    required this.child,
    this.onTap,
    this.enabled = true,
    this.color = Colors.blue,
    this.borderRadius = 8.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    this.iconRight ,
    this.iconLeft,
    this.height = 50,
    this.width = 250,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  enabled ==true? onTap : null , // set cứng dữ liệu, nếu mà enabled = fasle thì sẽ onTap sẽ null => không bấm được nút nữa
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: enabled ? color : const Color(0xFFCECCC5),
            borderRadius: BorderRadius.circular(borderRadius),
            boxShadow: [BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(-1, 4),
              blurRadius: 10,
              spreadRadius: 1,
            ),]
        ),
        padding: padding,
        child: Center(child: child),
      ),
    );
  }
}
