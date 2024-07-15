import 'package:flutter/material.dart';
import 'package:sequential_text_fade/sequential_text_fade.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SequentialTextFade(
            sequentialTextsList: [
              'JOIN THE FUN',
              'STAY TUNED',
              'GET READY',
              'DISCOVER MORE',
              'BE PART OF IT',
              'JUST IN',
            ],
            duration: Duration(seconds: 3),
            delay: Duration(seconds: 3),
            textAlignment: Alignment.centerLeft,
            textStyle: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w600,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
