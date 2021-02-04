import 'package:flutter/material.dart';
import 'package:productivityApp/screens/ScreensWrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xffE74C3C),
        scaffoldBackgroundColor: Color(0xffF2F2F2),
      ),
      home: ScreensWrapper(),
    );
  }
}
