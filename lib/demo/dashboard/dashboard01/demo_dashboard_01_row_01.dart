import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoDashboard01Row01 extends StatelessWidget {
  const DemoDashboard01Row01({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          md: 12,
          lg: 6,
          xl: 3,
          child: _buildInfo01(context),
        ),
        ResponsiveGridCol(
          md: 12,
          lg: 6,
          xl: 3,
          child: _buildInfo02(context),
        ),
        ResponsiveGridCol(
          md: 12,
          lg: 6,
          xl: 3,
          child: _buildInfo03(context),
        ),
        ResponsiveGridCol(
          md: 12,
          lg: 6,
          xl: 3,
          child: _buildInfo04(context),
        ),
      ],
    );
  }

  _buildInfo01(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUISectionContainer(
      child: FUIAnimationHelper.discernAnimator(
        fuiAnimationType: FUIAnimationType.fadeInDown,
        preferences: const AnimationPreferences(
          offset: Duration(milliseconds: 500),
        ),
        child: FUIPane(
          padding: EdgeInsets.zero,
          paceBarEnable: true,
          paceBarShow: true,
          paceBarRepeating: false,
          paceBarCurrentValue: 100,
          height: 150,
          child: FUIColumn(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PreH(const Text('REVENUE (MONTH)')),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: _buildUpIndicator(context, '+13.7%'),
                  ),
                ],
              ),
              DefaultTextStyle(
                style: typoTheme.h2.copyWith(fontSize: 60),
                child: const Text('2,203,493'),
              ),
              SmallText(const Text('For month of 07/24. Last updated - 00:00:23 04/07/24')),
            ],
          ),
        ),
      ),
    );
  }

  _buildInfo02(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUISectionContainer(
      child: FUIAnimationHelper.discernAnimator(
        fuiAnimationType: FUIAnimationType.fadeInDown,
        preferences: AnimationPreferences(
          offset: Duration(milliseconds: 500),
        ),
        child: FUIPane(
          padding: EdgeInsets.zero,
          paceBarEnable: true,
          paceBarShow: true,
          paceBarRepeating: false,
          paceBarCurrentValue: 100,
          height: 150,
          child: FUIColumn(
            children: [
              PreH(Text('CURRENT INVENTORY VALUE')),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DefaultTextStyle(
                    style: typoTheme.h2.copyWith(fontSize: 60),
                    child: Text('49M'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Icon(
                      LineAwesomeIcons.coins_solid,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SmallText(Text('Data source - Regional Branches')),
            ],
          ),
        ),
      ),
    );
  }

  _buildInfo03(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUISectionContainer(
      child: FUIAnimationHelper.discernAnimator(
        fuiAnimationType: FUIAnimationType.fadeInDown,
        preferences: const AnimationPreferences(
          offset: Duration(milliseconds: 500),
        ),
        child: FUIPane(
          padding: EdgeInsets.zero,
          paceBarEnable: true,
          paceBarShow: true,
          paceBarRepeating: false,
          paceBarCurrentValue: 100,
          height: 150,
          child: FUIColumn(
            children: [
              PreH(const Text('OPERATING PROFIT MARGIN')),
              Wrap(
                spacing: 40,
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  DefaultTextStyle(
                    style: typoTheme.h2.copyWith(fontSize: 60),
                    child: const Text('38%'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: _buildDownIndicator(context, '-1.3%'),
                  ),
                ],
              ),
              SmallText(const Text('Data source - Regional Branches')),
            ],
          ),
        ),
      ),
    );
  }

  _buildInfo04(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUISectionContainer(
      child: FUIAnimationHelper.discernAnimator(
        fuiAnimationType: FUIAnimationType.fadeInDown,
        preferences: const AnimationPreferences(
          offset: Duration(milliseconds: 500),
        ),
        child: FUIPane(
          padding: EdgeInsets.zero,
          paceBarEnable: true,
          paceBarShow: true,
          paceBarRepeating: false,
          paceBarCurrentValue: 100,
          height: 150,
          child: FUIColumn(
            children: [
              PreH(const Text('EXPENSE RATIO')),
              FUISpacer.vSpace10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  DefaultTextStyle(
                    style: typoTheme.h2.copyWith(fontSize: 50),
                    child: const Text('49M / 58M'),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 13),
                    child: Icon(
                      LineAwesomeIcons.chart_pie_solid,
                      size: 40,
                    ),
                  ),
                ],
              ),
              SmallText(const Text('Data source - Regional Branches')),
            ],
          ),
        ),
      ),
    );
  }

  _buildUpIndicator(BuildContext context, String textValue) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    double borderRadius = 5;
    double width = 60;
    double height = 25;
    double iconSize = 16;
    double fontSize = 11;
    Color commonColor = fuiColors.statusSuccess; // Try statusError.

    return Container(
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
          Text(textValue, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: commonColor)),
        ],
      ),
    );
  }

  _buildDownIndicator(BuildContext context, String textValue) {
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
          Text(textValue, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700, color: commonColor)),
        ],
      ),
    );
  }
}
