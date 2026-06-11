import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../exports.dart';

abstract class FUIModalTheme {
  static const double headingTitleFontSize = 18;
  static const Duration displayAnimationDuration = Duration(milliseconds: 300);

  /// Modal Box Shape Border Radius
  static const BorderRadius boxBorderRadius = BorderRadius.all(Radius.circular(6));

  /// Border thickness
  static const double borderThickness = 1;
  static const double headerSeparatorThickness = 1;
  static const double footerSeparatorThickness = 1;

  /// Top icon button size
  static const IconData headerCloseIcon = LineAwesomeIcons.times_solid;
  static const double headerIconButtonSize = 16;

  /// Paddings
  static const EdgeInsets headerPadding = EdgeInsets.only(
    left: 25,
    right: 25,
    top: 15,
    bottom: 8,
  );

  static const EdgeInsets contentPadding = EdgeInsets.only(
    right: 25,
    left: 25,
    top: 20,
    bottom: 20,
  );

  static const EdgeInsets footerPadding = EdgeInsets.only(
    left: 25,
    right: 25,
    top: 15,
    bottom: 20,
  );

  static const EdgeInsets headerIconPadding = EdgeInsets.only(
    left: 7,
  );

  /// Opacity values (while progress/loading is activated)
  static const opacityWhileLoading = 0.7;
  static const Duration opacityAniCtrlDuration = Duration(milliseconds: 1000);
  static const double opacityNormal = 1;
  static const double opacityFade = 0.6;

  /// Mouse over shadow
  static const double shadowElevate = 25;
  static const double shadowOffset = 3;
  static const double shadowSpreadRadius1 = 0;
  static const double shadowSpreadRadius2 = 2;

  /// Colors
  Color get barrierColor;

  Color get headerCloseIconColor;

  /// TextStyles
  TextStyle get headingTitle;
}

class FUIModalThemeLight extends FUIModalTheme {
  FUIThemeCommonColors fuiColors = FUIThemeCommonColorsLight();

  @override
  Color get barrierColor => Colors.black54.withValues(alpha: 0.5);

  @override
  Color get headerCloseIconColor => fuiColors.shade2;

  @override
  TextStyle get headingTitle => TextStyle(
        fontFamily: FUITypographyTheme.fontFamilyPrimary,
        fontSize: FUIModalTheme.headingTitleFontSize,
        fontWeight: FontWeight.w600,
        color: fuiColors.textHeading,
        decoration: TextDecoration.none,
      );
}
