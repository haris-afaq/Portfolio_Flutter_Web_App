import 'package:flutter/material.dart';

sealed class AppColors {
  static const Color seed = Color(0xFF4F46E5); 
  static const Color surfaceDark = Color(0xFF0B1220);
}

sealed class AppLayout {
  static const double maxContentWidth = 1120;

  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 1024;
}

sealed class AppSpacing {
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
  static const double sectionGap = 30;
}

sealed class AppRadii {
  static const BorderRadius card = BorderRadius.all(Radius.circular(16));
  static const BorderRadius button = BorderRadius.all(Radius.circular(14));
}

sealed class AppDurations {
  static const Duration fast = Duration(milliseconds: 160);
  static const Duration medium = Duration(milliseconds: 240);
  static const Duration slow = Duration(milliseconds: 360);
}
