import 'package:flutter/animation.dart';

sealed class AppCurves {
  static const Curve emphasized = Cubic(0.2, 0.0, 0.0, 1.0);
  static const Curve standard = Cubic(0.2, 0.0, 0.0, 1.0);
}
