import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetSmallInfo07 extends StatelessWidget {
  const DemoWidgetSmallInfo07({super.key});

  @override
  Widget build(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUIPanelTheme panelTheme = context.theme.fuiPanel;

    /// Attributes
    double height = 150;
    Color backgroundColor = fuiColors.secondary;
    Color textIconColor = fuiColors.shade0;
    double topIconSize = 55;
    double mainTextSize = 38;

    return FUIPanel(
      headerShow: false,
      panelBackgroundColor: backgroundColor,
      panelBorderColor: backgroundColor,
      height: height,
      contentScrollBarEnable: false,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text('OPERATING CASH FLOW', style: panelTheme.headingTitle.copyWith(color: textIconColor)),
                ),
                Icon(LineAwesomeIcons.chalkboard_solid, color: textIconColor, size: topIconSize),
              ],
            ),
          ),
          Text('10,985,000', style: typoTheme.h1.copyWith(color: textIconColor, fontSize: mainTextSize)),
          FUIButtonLinkTextIcon(
            fuiButtonSize: FUIButtonSize.small,
            text: Text('DETAILS'),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
