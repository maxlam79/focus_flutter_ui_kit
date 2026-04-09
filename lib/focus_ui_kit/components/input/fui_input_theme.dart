import 'package:flutter/material.dart';

import '../../exports.dart';

abstract class FUIInputTheme {
  /// Sizes
  static const double minWidth = 400;
  static const double sizeCursorWidth = 1.0;
  static const double sizeStatusTextTopMargin = 15;
  static const double sizeSideIcon = 20;
  static const double sizeContainerBorderThickness = 1;
  static const BorderRadius sizeBorderRadius = BorderRadius.all(Radius.circular(5));

  static const double sizeDatePickerDialogWidth = 310;
  static const double sizeDatePopupWidth = 310;
  static const double sizeDatePopupHeight = 310;
  static const double sizeDatePopupArrowWidth = 20;
  static const double sizeDatePopupArrowHeight = 10;

  static const double sizeTimePopupWidth = 380;
  static const double sizeTimePopupHeight = 310;

  static const double sizeSelectCategoryItemOverlaySettingsIcon = 14;
  static const double sizeSelectDropdownOverlayHeight = 300;
  static const double sizePillboxConstraintHeight = 30;

  static const double sizeToggleWidth = 60;
  static const double sizeToggleHeight = 30;
  static const double sizeToggle = 20;
  static const double sizeToggleValueFont = 13;
  static const double sizeToggleBorderRadius = 20;
  static const double sizeTogglePadding = 6;

  static const double sizeToggleSmallScale = 0.8;
  static const double sizeToggleMediumScale = 1;
  static const double sizeToggleLargeScale = 1.2;

  static const double sizeRadioSmallScale = 0.8;
  static const double sizeRadioMediumScale = 1;
  static const double sizeRadioLargeScale = 1.2;

  static const double sizeSliderSmallTrackHeight = 1;
  static const double sizeSliderMediumTrackHeight = 2;
  static const double sizeSliderLargeTrackHeight = 3;

  static const double tagDistanceToFieldFactor = 0.8;
  static const double tagWrapSpacing = 2;
  static const double tagWrapRunSpacing = 2;

  /// Defaults
  static const String defaultMandatoryCharacter = '*';
  static const String defaultMultiSelectValueDelimiter = ';';

  /// Animation
  static const Duration labelResizeAniDuration = Duration(milliseconds: 100);
  static const Duration labelResizeOpacityAniDuration = Duration(milliseconds: 100);
  static const Curve labelResizeAniCurve = Curves.linear;
  static const Curve labelResizeOpacityAniCurve = Curves.linear;
  static const double labelOpacityNormal = 1;
  static const double labelOpacityShrink = 0.6;
  static const Duration enableOpacityAniDuration = Duration(milliseconds: 100);
  static const Curve enableOpacityAniCurve = Curves.linear;
  static const double enableOpacityNormal = 1;
  static const double enableOpacityDisabled = 0.7;
  static const Duration toggleAniDuration = Duration(milliseconds: 200);
  static const Curve toggleAniCurve = Curves.linear;

  /// Font Sizes
  static const double fontSizeTitle = 13;
  static const double fontSizeTitleOnFocus = 11;
  static const double fontSizeLabelSmall = 12;
  static const double fontSizeLabelMedium = 14;
  static const double fontSizeLabelLarge = 16;
  static const double fontSizeValueSmall = 12;
  static const double fontSizeValueMedium = 14;
  static const double fontSizeValueLarge = 16;
  static const double fontSizeRequired = 14;
  static const double fontSizeStatus = 13;
  static const double fontSizeSelectCatNameSmall = 14;
  static const double fontSizeSelectCatNameMedium = 16;
  static const double fontSizeSelectCatNameLarge = 18;
  static const double fontSizeSelectCatNameModalSmall = 15;
  static const double fontSizeSelectCatNameModalMedium = 17;
  static const double fontSizeSelectCatNameModalLarge = 19;
  static const double fontSizeSelectItem = 14;
  static const double fontSizeSelectItemExt = 12;
  static const double fontSizeSelectValueSmall = 10;
  static const double fontSizeSelectValueMedium = 12;
  static const double fontSizeSelectValueLarge = 12;
  static const double fontSizeSelectRequired = 14;
  static const double fontSizeTimePickerItemSmall = 12;
  static const double fontSizeTimePickerItemMedium = 14;
  static const double fontSizeTimePickerItemLarge = 16;
  static const double fontSizeTimePickerButton = 12;
  static const double fontSizeTagSmall = 11;
  static const double fontSizeTagMedium = 13;
  static const double fontSizeTagLarge = 15;

  /// Paddings and Margins
  static const EdgeInsets paddingContainer = EdgeInsets.only(left: 8, right: 8, top: 8);
  static const EdgeInsets paddingContentSmall = EdgeInsets.only(top: 9, bottom: 11);
  static const EdgeInsets paddingContentMedium = EdgeInsets.only(top: 9, bottom: 13);
  static const EdgeInsets paddingContentLarge = EdgeInsets.only(top: 9, bottom: 15);
  static const EdgeInsets paddingSideIconContainer = EdgeInsets.only(right: 13, left: 13);
  static const EdgeInsets paddingMandatoryIndicator = EdgeInsets.only(right: 8);
  static const EdgeInsets paddingSelectIconIndicator = EdgeInsets.only(right: 5);
  static const EdgeInsets paddingSelectSearchBarOverlay = EdgeInsets.symmetric(horizontal: 16);
  static const EdgeInsets marginSelectSearchBarOverlay = EdgeInsets.only(top: 9, left: 5, right: 5, bottom: 2);
  static const EdgeInsets paddingSelectSearchBarOverlayIcon = EdgeInsets.only(right: 4);
  static const EdgeInsets paddingSelectCatNameModal = EdgeInsets.only(left: 16);
  static const EdgeInsets paddingSelectTitleModal = EdgeInsets.only(left: 16);

  static const double tagContainerPlusWidthSmall = 35;
  static const double tagContainerPlusWidthMedium = 40;
  static const double tagContainerPlusWidthLarge = 45;
  static const double tagContainerPlusHeightSmall = 9;
  static const double tagContainerPlusHeightMedium = 10;
  static const double tagContainerPlusHeightLarge = 11;
  static const EdgeInsets tagPaddingSmall = EdgeInsets.all(2);
  static const EdgeInsets tagPaddingMedium = EdgeInsets.all(3);
  static const EdgeInsets tagPaddingLarge = EdgeInsets.all(4);

  static const BorderRadius tagBorderRadius = BorderRadius.all(Radius.circular(30));

  /// *** Input Related ***
  TextStyle get tsLabel;

  TextStyle get tsHintSmall;

  TextStyle get tsHintMedium;

  TextStyle get tsHintLarge;

  TextStyle get tsValueSmall;

  TextStyle get tsValueMedium;

  TextStyle get tsValueLarge;

  TextStyle get tsMandatory;

  TextStyle get tsStatusNormal;

  TextStyle get tsStatusSuccess;

  TextStyle get tsStatusComplete;

  TextStyle get tsStatusWarn;

  TextStyle get tsStatusError;

  /// *** Input (Select) Related ***
  TextStyle get tsSelectTitleModal;

  TextStyle get tsSelectCatNameSmall;

  TextStyle get tsSelectCatNameMedium;

  TextStyle get tsSelectCatNameLarge;

  TextStyle get tsSelectItem;

  TextStyle get tsSelectItemExtInfo;

  TextStyle get tsSelectCategoryItemOverlaySmall;

  TextStyle get tsSelectCategoryItemOverlayMedium;

  TextStyle get tsSelectCategoryItemOverlayLarge;

  TextStyle get tsSelectCategoryItemOverlaySelectedSmall;

  TextStyle get tsSelectCategoryItemOverlaySelectedMedium;

  TextStyle get tsSelectCategoryItemOverlaySelectedLarge;

  TextStyle get tsSelectCategoryNameModalSmall;

  TextStyle get tsSelectCategoryNameModalMedium;

  TextStyle get tsSelectCategoryNameModalLarge;

  TextStyle get tsSelectValueSmall;

  TextStyle get tsSelectValueMedium;

  TextStyle get tsSelectValueLarge;

  TextStyle get tsSelectModalDoneButton;

  /// *** Input Field (Date) Related ***
  Color get barrierColor;

  Color get dialogBackgroundColor;

  TextStyle get tsDateControls;

  TextStyle get tsDateDay;

  TextStyle get tsDateDisplayDay;

  TextStyle get tsDateSelectedDay;

  TextStyle get tsDateSelectedYear;

  TextStyle get tsDateToday;

  TextStyle get tsDateYear;

  TextStyle get tsWeekdayLabel;

  /// *** Input Field (Time) Related ***
  TextStyle get tsTimeItemSmall;

  TextStyle get tsTimeItemMedium;

  TextStyle get tsTimeItemLarge;

  TextStyle get tsTimeItemSelectedSmall;

  TextStyle get tsTimeItemSelectedMedium;

  TextStyle get tsTimeItemSelectedLarge;

  TextStyle get tsTimeTitleSmall;

  TextStyle get tsTimeTitleMedium;

  TextStyle get tsTimeTitleLarge;

  TextStyle get tsTimeConfirmButtonStyle;

  TextStyle get tsTimeCancelButtonStyle;

  /// *** Input Field (Toggle Switch) Related ***
  TextStyle get tsToggleSwitchActiveSmall;

  TextStyle get tsToggleSwitchActiveMedium;

  TextStyle get tsToggleSwitchActiveLarge;

  TextStyle get tsToggleSwitchInactiveSmall;

  TextStyle get tsToggleSwitchInactiveMedium;

  TextStyle get tsToggleSwitchInactiveLarge;

  /// *** Input Field (Checkbox/Radio) Related ***
  TextStyle get tsCRSelectedSmall;

  TextStyle get tsCRSelectedMedium;

  TextStyle get tsCRSelectedLarge;

  TextStyle get tsCRUnselectedSmall;

  TextStyle get tsCRUnselectedMedium;

  TextStyle get tsCRUnselectedLarge;

  /// *** Input Field (Tag) Related ***
  TextStyle get tsTagTextPillWhiteSmall;

  TextStyle get tsTagTextPillWhiteMedium;

  TextStyle get tsTagTextPillWhiteLarge;

  TextStyle get tsTagTextPillBlackSmall;

  TextStyle get tsTagTextPillBlackMedium;

  TextStyle get tsTagTextPillBlackLarge;
}

class FUIInputThemeLight extends FUIInputTheme {
  final FUIThemeCommonColorsLight fuiColors = FUIThemeCommonColorsLight();
  final FUITypographyTheme typoTheme = FUITypographyThemeLight();

  /// *** Input Field Related ***
  @override
  TextStyle get tsLabel => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeTitle,
    fontWeight: FontWeight.w600,
    color: fuiColors.shade3,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsHintSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeLabelSmall,
    fontWeight: FontWeight.normal,
    color: fuiColors.shade2,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsHintMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeLabelMedium,
    fontWeight: FontWeight.normal,
    color: fuiColors.shade2,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsHintLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeLabelLarge,
    fontWeight: FontWeight.normal,
    color: fuiColors.shade2,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsValueSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueSmall,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsValueMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueMedium,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsValueLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueLarge,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsMandatory => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeRequired,
    fontWeight: FontWeight.w600,
    color: Colors.red,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsStatusNormal => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeStatus,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsStatusSuccess => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeStatus,
    fontWeight: FontWeight.normal,
    color: fuiColors.statusSuccess,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsStatusComplete => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeStatus,
    fontWeight: FontWeight.normal,
    color: fuiColors.statusComplete,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsStatusWarn => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeStatus,
    fontWeight: FontWeight.normal,
    color: fuiColors.statusWarning,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsStatusError => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeStatus,
    fontWeight: FontWeight.normal,
    color: fuiColors.statusError,
    decoration: TextDecoration.none,
  );

  /// *** Input Field (Select) Related ***
  @override
  TextStyle get tsSelectTitleModal => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeTitle,
    fontWeight: FontWeight.w700,
    color: fuiColors.textHeading,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCatNameSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectCatNameSmall,
    fontWeight: FontWeight.w500,
    color: fuiColors.secondary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCatNameMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectCatNameMedium,
    fontWeight: FontWeight.w500,
    color: fuiColors.secondary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCatNameLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectCatNameLarge,
    fontWeight: FontWeight.w500,
    color: fuiColors.secondary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectItem => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectItem,
    fontWeight: FontWeight.normal,
    color: fuiColors.secondary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectItemExtInfo => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectItemExt,
    fontWeight: FontWeight.w300,
    color: fuiColors.shade3,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlaySmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueSmall,
    fontWeight: FontWeight.w500,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlayMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueMedium,
    fontWeight: FontWeight.w500,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlayLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueLarge,
    fontWeight: FontWeight.w500,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlaySelectedSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueSmall,
    fontWeight: FontWeight.w500,
    color: fuiColors.primary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlaySelectedMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueMedium,
    fontWeight: FontWeight.w500,
    color: fuiColors.primary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryItemOverlaySelectedLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeValueLarge,
    fontWeight: FontWeight.w500,
    color: fuiColors.primary,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryNameModalSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontSize: FUIInputTheme.fontSizeSelectCatNameModalSmall,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryNameModalMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontSize: FUIInputTheme.fontSizeSelectCatNameModalMedium,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectCategoryNameModalLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontSize: FUIInputTheme.fontSizeSelectCatNameModalLarge,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectValueSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectValueSmall,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectValueMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectValueMedium,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectValueLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: FUIInputTheme.fontSizeSelectValueLarge,
    fontWeight: FontWeight.normal,
    color: fuiColors.textBody,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsSelectModalDoneButton => typoTheme.regular.copyWith(fontWeight: FontWeight.w600);

  /// *** Input Field (Date) Related ***
  @override
  Color get barrierColor => Colors.black54.withValues(alpha: 0.5);

  @override
  Color get dialogBackgroundColor => fuiColors.bg0;

  @override
  TextStyle get tsDateControls => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateDay => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateDisplayDay => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateSelectedDay => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    color: fuiColors.shade0,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateSelectedYear => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    color: fuiColors.shade0,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateToday => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsDateYear => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsWeekdayLabel => const TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  /// *** Input Field (Time) Related ***
  @override
  TextStyle get tsTimeItemSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemSmall,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeItemMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemMedium,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeItemLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemLarge,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeItemSelectedSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.primary,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemSmall,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeItemSelectedMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.primary,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemMedium,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeItemSelectedLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.primary,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerItemLarge,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeTitleSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontWeight: FontWeight.w600,
    fontSize: FUIInputTheme.fontSizeTimePickerItemSmall,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeTitleMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontWeight: FontWeight.w600,
    fontSize: FUIInputTheme.fontSizeTimePickerItemMedium,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeTitleLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHeading,
    fontWeight: FontWeight.w600,
    fontSize: FUIInputTheme.fontSizeTimePickerItemLarge,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeConfirmButtonStyle => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.primary,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerButton,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsTimeCancelButtonStyle => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.primary,
    fontWeight: FontWeight.normal,
    fontSize: FUIInputTheme.fontSizeTimePickerButton,
    decoration: TextDecoration.none,
  );

  /// *** Input Field (Toggle Switch) Related ***
  @override
  TextStyle get tsToggleSwitchActiveSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsToggleSwitchActiveMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsToggleSwitchActiveLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsToggleSwitchInactiveSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 11,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsToggleSwitchInactiveMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 13,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsToggleSwitchInactiveLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.shade1,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    decoration: TextDecoration.none,
  );

  /// *** Input Field (Checkbox/Radio) Related ***
  @override
  TextStyle get tsCRSelectedSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textBody,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsCRSelectedMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textBody,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsCRSelectedLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textBody,
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsCRUnselectedSmall => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsCRUnselectedMedium => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.w500,
    fontSize: 14,
    decoration: TextDecoration.none,
  );

  @override
  TextStyle get tsCRUnselectedLarge => TextStyle(
    fontFamily: FUITypographyTheme.fontFamilyPrimary,
    color: fuiColors.textHinted,
    fontWeight: FontWeight.w500,
    fontSize: 12,
    decoration: TextDecoration.none,
  );

  /// *** Input Field (Tag) Related ***
  @override
  TextStyle get tsTagTextPillWhiteSmall => _discernTagTextStyleWhite(FUIInputTheme.fontSizeTagSmall);

  @override
  TextStyle get tsTagTextPillWhiteMedium => _discernTagTextStyleWhite(FUIInputTheme.fontSizeTagMedium);

  @override
  TextStyle get tsTagTextPillWhiteLarge => _discernTagTextStyleWhite(FUIInputTheme.fontSizeTagLarge);

  @override
  TextStyle get tsTagTextPillBlackSmall => _discernTagTextStyleBlack(FUIInputTheme.fontSizeTagSmall);

  @override
  TextStyle get tsTagTextPillBlackMedium => _discernTagTextStyleBlack(FUIInputTheme.fontSizeTagMedium);

  @override
  TextStyle get tsTagTextPillBlackLarge => _discernTagTextStyleBlack(FUIInputTheme.fontSizeTagLarge);

  TextStyle _discernTagTextStyleWhite(double fontSize) {
    return TextStyle(
      color: fuiColors.shade0,
      fontFamily: FUITypographyTheme.fontFamilyPrimary,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }

  TextStyle _discernTagTextStyleBlack(double fontSize) {
    return TextStyle(
      color: fuiColors.textHeading,
      fontFamily: FUITypographyTheme.fontFamilyPrimary,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.none,
    );
  }
}
