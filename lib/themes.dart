import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryOrange = Color(0xFFFFA500);
  static const Color backgroundGrey = Color(0xFFF4F7F6);
  static const Color textDark = Color(0xFF2D3748);
  static const Color textGrey = Color(0xFF718096);

  static TextStyle heading = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: textDark,
  );
  static TextStyle subHeading = GoogleFonts.inter(
    fontSize: 14,
    color: textGrey,
  );
  static TextStyle inputLabel = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: textDark,
  );
}
