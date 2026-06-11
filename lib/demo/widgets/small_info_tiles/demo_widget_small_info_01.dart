import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:color_shade/color_shade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetSmallInfo01 extends StatelessWidget {
  const DemoWidgetSmallInfo01({super.key});

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
          PreH(Text('2024 Q3 Revenue (USD)')),
          Wrap(
            spacing: 40,
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.end,
            children: [
              DefaultTextStyle(
                style: typoTheme.h2.copyWith(fontSize: 60),
                child: Text('20M'),
              ),
              _buildUpIndicator(context),
            ],
          ),
          SmallText(Text('Data source - Regional Branches')),
        ],
      ),
    );
  }

  _buildUpIndicator(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    double bottomPadding = 14;
    double borderRadius = 5;
    double width = 60;
    double height = 25;
    double iconSize = 16;
    double fontSize = 11;
    Color commonColor = fuiColors.statusSuccess; // Try statusError.

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          border: Border.all(
            color: commonColor.shade300,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(borderRadius),
          color: commonColor.shade100,
        ),
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            Icon(BootstrapIcons.caret_up_fill, size: iconSize, color: commonColor),
            Text('+13%', style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: commonColor)),
          ],
        ),
      ),
    );
  }
}
