import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetSmallInfo06 extends StatelessWidget {
  const DemoWidgetSmallInfo06({super.key});

  @override
  Widget build(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    /// Attributes
    double height = 150;
    Color backgroundColor = fuiColors.secondary;
    Color textIconColor = fuiColors.shade0;
    Color bottomDescColor = fuiColors.shade2;
    double headerIconTextSize = 16;
    double mainContentIconTextSize = 38;

    return FUIPanel(
      headerShow: true,
      headerSeparator: false,
      header: Text('TOTAL CAPITALIZATION', style: TextStyle(color: textIconColor)),
      headerIconButtons: [
        FUIButtonLinkIcon(
          icon: Icon(LineAwesomeIcons.external_link_alt_solid, color: textIconColor, size: headerIconTextSize),
          onPressed: () {},
        ),
        FUIButtonLinkIcon(
          icon: Icon(LineAwesomeIcons.sync_alt_solid, color: textIconColor, size: headerIconTextSize),
          onPressed: () {},
        ),
      ],
      paceBarEnable: false,
      height: height,
      contentScrollBarEnable: false,
      panelBorderColor: backgroundColor,
      panelBackgroundColor: backgroundColor,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text('65,316M', style: typoTheme.h1.copyWith(color: textIconColor, fontSize: mainContentIconTextSize)),
                Icon(LineAwesomeIcons.stream_solid, size: mainContentIconTextSize, color: textIconColor),
              ],
            ),
          ),
          FUISpacer.vSpace10,
          SmallText(Text('Lat updated - 22/05/2024 13:00:00', style: TextStyle(color: bottomDescColor))),
        ],
      ),
    );
  }
}
