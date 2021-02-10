import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.fromLTRB(0, 17, 0, 0),
  labelStyle: TextStyle(
    color: Color(0xFF060C2D),
    fontWeight: FontWeight.normal,
    fontSize: 18.0,
    letterSpacing: 0.15,
  ),
  // border: const OutlineInputBorder(),
  border: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF060C2D),
    ),
  ),
  focusedBorder: UnderlineInputBorder(
    borderSide: BorderSide(
      color: Color(0xFF060C2D),
      width: 2,
    ),
  ),
  // enabledBorder: InputBorder.none,
  // errorBorder: UnderlineInputBorder(
  //   borderSide: BorderSide(color: Colors.red, width: 2),
  // ),
);
