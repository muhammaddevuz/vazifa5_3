import 'package:dars_5_3_getx/views/screens/word_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: WordScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
