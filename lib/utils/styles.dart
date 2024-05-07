import 'package:flutter/material.dart';

class DefaultStyles {
  static const inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black38, width: 1.0),
      borderRadius: BorderRadius.zero,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.zero,
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.0),
      borderRadius: BorderRadius.zero,
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1.5),
      borderRadius: BorderRadius.zero,
    ),
    hintStyle: TextStyle(
      letterSpacing: -0.06,
      color: Colors.black38,
    ),
    contentPadding: EdgeInsets.fromLTRB(12, 14, 0, 14),
  );

  static const labelStyle = TextStyle(
    fontWeight: FontWeight.w500,
    letterSpacing: -0.02,
    fontSize: 16,
  );
}
