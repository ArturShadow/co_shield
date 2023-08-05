import 'package:flutter/material.dart';
import 'drawer.dart';

Future main() async {
  await inicializar(null);
  return runApp(MyApp());
}

Future inicializar(BuildContext? context) async {
  await Future.delayed(const Duration(seconds: 2));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection:
            TextDirection.ltr, // Replace with your desired text direction
        child: Menu(),
      ),
    );
  }
}
