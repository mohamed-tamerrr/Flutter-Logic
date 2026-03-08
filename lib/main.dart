import 'package:flutter/material.dart';
import 'package:flutter_logic/root.dart';

void main() {
  runApp(const FlutterLogic());
}

class FlutterLogic extends StatelessWidget {
  const FlutterLogic({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
    );
  }
}
