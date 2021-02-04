import 'package:flutter/material.dart';
import 'package:productivityApp/utils/ui/colorguide.dart';
import 'package:productivityApp/utils/ui/styleguide.dart';

class Activity extends StatefulWidget {
  @override
  _ActivityState createState() => _ActivityState();
}

class _ActivityState extends State<Activity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'oi',
            style: darkHeadingBold,
          )
        ],
      ),
    );
  }
}
