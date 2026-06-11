import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetSmallInfo02 extends StatelessWidget {
  const DemoWidgetSmallInfo02({super.key});

  @override
  Widget build(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUIPane(
      padding: EdgeInsets.zero,
      paceBarEnable: true,
      paceBarShow: true,
      paceBarRepeating: false,
      paceBarCurrentValue: 100,
      height: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreH(Text('TOTAL GLOBAL HEAD COUNT')),
          DefaultTextStyle(
            style: typoTheme.h2.copyWith(fontSize: 60),
            child: Text('18,936'),
          ),
          FUISpacer.vSpace10,
          _buildDownIndicator(context),
        ],
      ),
    );
  }

  _buildDownIndicator(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    double borderRadius = 5;
    double width = 60;
    double height = 25;
    double iconSize = 16;
    double fontSize = 11;
    Color commonColor = fuiColors.statusError; // Try statusError.

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: commonColor.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        color: commonColor.shade100,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          Icon(BootstrapIcons.caret_down_fill, size: iconSize, color: commonColor),
          Text('+13%', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: commonColor)),
        ],
      ),
    );
  }
}
