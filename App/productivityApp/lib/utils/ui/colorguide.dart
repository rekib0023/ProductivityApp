import 'package:flutter/material.dart';

final Color primaryColor = Color(0xFFe04759);
final Color primaryColorDark = Color(0xFFd83044);
final Color blueAccent = Color(0xFF09cedb);
final Color purpleAccent = Color(0xFFE43CE7);
final Color yellowAccent = Color(0xFFE7E03C);
final Color greenAccent = Color(0xFF3CE743);
final Color darkColor = Color(0xFF2C070C);
final Color lightColor = Color(0xFFF6F7FE);

final LinearGradient primaryGradient = LinearGradient(
  begin: Alignment.bottomLeft,
  end: Alignment(0.8, 0.0),
  colors: [primaryColorDark, primaryColor],
);

final RadialGradient bgGradient = RadialGradient(
  center: const Alignment(0.7, -0.6), // near the top right
  radius: 0.2,
  colors: [
    const Color(0xFFFFFF00), // yellow sun
    const Color(0xFF0099FF), // blue sky
  ],
  stops: [0.4, 1.0],
);
