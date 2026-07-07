import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  AppTextStyles._();

  // Brand Name (Splash, Welcome)
  static final TextStyle brand = GoogleFonts.sora(
    fontSize: 34,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2,
  );

  // Screen Titles
  static final TextStyle heading1 = GoogleFonts.sora(
    fontSize: 28,
    fontWeight: FontWeight.w700,
  );

  // Section Headings
  static final TextStyle heading2 = GoogleFonts.sora(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  // Normal Body Text
  static final TextStyle body = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );

  // Captions / Helper Text
  static final TextStyle caption = GoogleFonts.inter(
    fontSize: 15,
    color: Colors.grey,
    fontWeight: FontWeight.w400,
  );

  // Buttons
  static final TextStyle button = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
}