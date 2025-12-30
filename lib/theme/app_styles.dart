


import 'package:flutter/cupertino.dart';

class AppStyles {
  // ---------- REGULAR (w400) ----------
  static TextStyle regular(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle regularItalic(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.w400,
    );
  }

  // ---------- MEDIUM (w500) ----------
  static TextStyle medium(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w500,
    );
  }

  // ---------- SEMIBOLD (w600) ----------
  static TextStyle semiBold(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w600,
    );
  }

  // ---------- BOLD (w700) ----------
  static TextStyle bold(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w700,
    );
  }

  // ---------- EXTRABOLD (w800) ----------
  static TextStyle extraBold(int size, Color color) {
    return TextStyle(
      fontFamily: "WorkSans",
      color: color,
      fontSize: size.toDouble(),
      fontWeight: FontWeight.w800,
    );
  }
}