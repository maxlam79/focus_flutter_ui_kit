import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../exports.dart';

abstract class FUIFileUploadTheme {
  /// DropBox
  static const double dropboxBorderRadius = 10;
  static const double dropboxHeight = 200;
  static const List<double> dropboxDashPattern = [6, 3];
  static const IconData dropboxUploadIcon = LineAwesomeIcons.cloud_upload_alt_solid;
  static const String dropboxUploadText = 'Drag & drop your files to upload or \'click/tap\' to select the files';
  static const EdgeInsets dropboxUploadTextPadding = EdgeInsets.all(10);

  /// Animation
  static const double opacityDuringDisabled = 0.6;
  static const Duration opacityAniDuration = Duration(milliseconds: 300);

  /// File Upload Item
  static const double itemHeight = 60;
  static const double itemLeftDecoBarWidth = 5;
  static const EdgeInsets itemLeftDecoBarPadding = EdgeInsets.only(right: 10);
  static const double itemTsLine1FontSize = 12;
  static const double itemTsLine2FontSize = 11;
  static const double itemTsLine3FontSize = 11;
  static const IconData itemFileIcon = LineAwesomeIcons.file;
  static const double itemFileIconSize = 28;

  /// Colors
  Color get dropboxBorderColor;
  Color get itemFileIconColor;

  /// TextStyle
  TextStyle get tsBase => const TextStyle(
        fontFamily: FUITypographyTheme.fontFamilyPrimary,
        decoration: TextDecoration.none,
      );

  TextStyle get tsLine1;
  TextStyle get tsLine2;
  TextStyle get tsLine3;
}

class FUIFileUploadThemeLight extends FUIFileUploadTheme {
  FUIThemeCommonColors colors = FUIThemeCommonColorsLight();

  /// Colors
  @override
  Color get dropboxBorderColor => colors.shade3;

  @override
  Color get itemFileIconColor => colors.shade3;

  /// TextStyle
  @override
  TextStyle get tsLine1 => tsBase.copyWith(
        fontWeight: FontWeight.w700,
        color: colors.textHeading,
        fontSize: FUIFileUploadTheme.itemTsLine1FontSize,
      );

  @override
  TextStyle get tsLine2 => tsBase.copyWith(
        fontWeight: FontWeight.w500,
        color: colors.textBody,
        fontSize: FUIFileUploadTheme.itemTsLine2FontSize,
      );

  @override
  TextStyle get tsLine3 => tsBase.copyWith(
        fontWeight: FontWeight.w500,
        color: colors.textHinted,
        fontSize: FUIFileUploadTheme.itemTsLine3FontSize,
      );
}
