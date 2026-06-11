import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

abstract class FUISpinnerTheme {
  /// Sizes
  static const IconData defaultIcon = LineAwesomeIcons.circle_notch_solid;
  static const double defaultSize = 30;
  static const EdgeInsets padding = EdgeInsets.all(10);

  /// Animation
  static const Duration rotationAniDuration = Duration(seconds: 50);
  static const Curve rotationAniCurve = Curves.linear;
}

class FUISpinnerThemeLight extends FUISpinnerTheme {}
