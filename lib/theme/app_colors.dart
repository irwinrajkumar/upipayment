import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF4A3AFF); // Vibrant Indigo
  static const Color primaryDark = Color(0xFF2D20A1);
  static const Color background = Color(0xFFF5F7FA);
  static const Color surface = Colors.white;

  static const Color textPrimary = Color(0xFF1A1D1E);
  static const Color textSecondary = Color(0xFF6A707C);

  static const Color success = Color(0xFF2ECA7F);
  static const Color warning = Color(0xFFFFB020);
  static const Color error = Color(0xFFFF5252);

  // Gradient colors
  static const Gradient primaryGradient = LinearGradient(
    colors: [Color(0xFF5F50FF), Color(0xFF3F2BFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
