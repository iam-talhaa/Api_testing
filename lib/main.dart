import 'package:flutter/material.dart';
import 'package:flutter_api_practice/Ui/APi/getPost.dart';

void main() {
  runApp(Flutter_api());
}

class Flutter_api extends StatefulWidget {
  const Flutter_api({super.key});

  @override
  State<Flutter_api> createState() => _Flutter_apiState();
}

class _Flutter_apiState extends State<Flutter_api> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Get_post_api(),
    );
  }
}
