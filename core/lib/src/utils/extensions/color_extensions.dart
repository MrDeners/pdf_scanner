import 'package:flutter/material.dart';

extension ColorInverter on Color {
  Color getVisibleOn() {
    final double luminance = computeLuminance();
    return luminance < 0.5 ? Colors.white : Colors.black;
  }
}
