import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetSmallInfo04 extends StatelessWidget {
  const DemoWidgetSmallInfo04({super.key});

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
          PreH(Text('2024 MARKET SHARE (%)')),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DefaultTextStyle(
                style: typoTheme.h2.copyWith(fontSize: 60),
                child: Text('38%'),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 13),
                child: Icon(
                  LineAwesomeIcons.chart_pie_solid,
                  size: 40,
                ),
              ),
            ],
          ),
          SmallText(Text('Data source - Regional Branches')),
        ],
      ),
    );
  }
}
