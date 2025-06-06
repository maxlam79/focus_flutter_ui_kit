import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoColorsGroup3 extends StatelessWidget {
  const DemoColorsGroup3({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      padding: FUISectionTheme.eiSecContainerPaddingOnlyHorizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PreH(Text('Group 3')),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                md: 12,
                lg: 6,
                child: _buildColor('Denim', fuiColors.namedDenim),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 6,
                child: _buildColor('Prussian', fuiColors.namedPrussian),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 6,
                child: _buildColor('Bumble Bee', fuiColors.namedBumbleBee),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 6,
                child: _buildColor('Banana', fuiColors.namedBanana),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildColor(String colorName, Color color) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FUISpacer.vSpace10,
          Regular(Text(colorName, softWrap: false)),
          FUISpacer.vSpace10,
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
            ),
          ),
          FUISpacer.vSpace10,
        ],
      ),
    );
  }
}
