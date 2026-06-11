import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:chart_sparkline/chart_sparkline.dart';
import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance02 extends StatelessWidget {
  const DemoWidgetFinance02({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('Revenue'),
      height: responsiveValue(context, md: FUIPanelTheme.defaultHeight, xs: 720),
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: false,
      content: FUIColumn(
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildSec01(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildSec02(context),
              ),
            ],
          ),
          FUISpacer.vSpace30,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 4,
                child: _buildSec03(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 4,
                child: _buildSec04(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 4,
                child: _buildSec05(context),
              ),
            ],
          ),
          FUISpacer.vSpace30,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildSec06(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildSec07(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildHeaderIconButtons(BuildContext context) {
    FUIPanelTheme panelTheme = context.theme.fuiPanel;

    var mdList = [
      FUIButtonLinkIcon(
        icon: Icon(
          LineAwesomeIcons.external_link_alt_solid,
          size: FUIPanelTheme.headerIconButtonSize,
          color: panelTheme.headerIconButtonColor,
        ),
        onPressed: () {},
      ),
      FUIButtonLinkIcon(
        icon: Icon(
          LineAwesomeIcons.sync_alt_solid,
          size: FUIPanelTheme.headerIconButtonSize,
          color: panelTheme.headerIconButtonColor,
        ),
        onPressed: () {},
      ),
    ];

    var smList = [
      FUIPopupMenuIconButton(fuiPopupMenuItemList: [
        FUIPopupMenuItem(
          label: Text('Explore'),
          icon: Icon(LineAwesomeIcons.external_link_alt_solid),
        ),
        FUIPopupMenuItem(
          label: Text('Refresh'),
          icon: Icon(LineAwesomeIcons.sync_alt_solid),
        ),
      ])
    ];

    return responsiveValue(context, md: mdList, sm: smList, xs: smList);
  }

  _buildSec01(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return Align(
      alignment: Alignment.center,
      child: FUIColumn(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(LineAwesomeIcons.signal_solid, size: typoTheme.h2.fontSize),
              FUISpacer.hSpace10,
              Text('Q2 2024', style: typoTheme.h2),
              FUISpacer.hSpace10,
              Text('Audited', style: typoTheme.h5.copyWith(color: fuiColors.shade3)),
            ],
          ),
          FUISpacer.vSpace10,
          Container(
            width: double.infinity,
            padding: EdgeInsets.zero,
            child: Wrap(
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 10,
              children: [
                FUITextPill(fuiColorScheme: FUIColorScheme.primary, pillShape: FUITextPillShape.square, text: Text('Published')),
                FUITextPill(fuiColorScheme: FUIColorScheme.lightGrey, pillShape: FUITextPillShape.square, text: Text('Audited')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildSec02(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: responsiveValue(
          context,
          md: EdgeInsets.zero,
          sm: EdgeInsets.only(top: 30),
          xs: EdgeInsets.only(top: 30),
        ),
        child: Text('3,927,493', style: typoTheme.h1),
      ),
    );
  }

  _buildSec03(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        H1(Text('64%')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('Sales', style: TextStyle(fontWeight: FontWeight.w700)), padding: EdgeInsets.zero),
              _buildUpIndicator(context),
            ],
          ),
        ),
      ],
    );
  }

  _buildSec04(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        H1(Text('29%')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('Services', style: TextStyle(fontWeight: FontWeight.w700)), padding: EdgeInsets.zero),
              _buildDownIndicator(context),
            ],
          ),
        ),
      ],
    );
  }

  _buildSec05(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        H1(Text('7%')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('Dividend', style: TextStyle(fontWeight: FontWeight.w700)), padding: EdgeInsets.zero),
              _buildUpIndicator(context),
            ],
          ),
        ),
      ],
    );
  }

  _buildSec06(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PreH(Text(
          'Previous Quarter',
          style: TextStyle(color: fuiColors.shade3),
        )),
        H2(Text('2,674,303')),
      ],
    );
  }

  _buildSec07(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    List<double> mockData = [
      3456782,
      3320392,
      2938493,
      3103948,
      3493840,
      3980493,
      3890283,
    ];

    return Container(
      padding: EdgeInsets.zero,
      child: Sparkline(
        data: mockData,
        lineColor: fuiColors.primary,
        lineWidth: 1.5,
        useCubicSmoothing: true,
        cubicSmoothingFactor: 0.2,
        fillMode: FillMode.below,
        fillGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            fuiColors.primary.shade800,
            fuiColors.primary.shade200,
          ],
        ),
      ),
    );
  }

  _buildUpIndicator(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    double topPadding = 5;
    double bottomPadding = 3;
    double borderRadius = 5;
    double width = 55;
    double height = 20;
    double iconSize = 14;
    double fontSize = 9;
    Color commonColor = fuiColors.statusSuccess; // Try statusError.

    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
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

  _buildDownIndicator(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    double topPadding = 5;
    double bottomPadding = 3;
    double borderRadius = 5;
    double width = 55;
    double height = 20;
    double iconSize = 14;
    double fontSize = 9;
    Color commonColor = fuiColors.statusError; // Try statusError.

    return Padding(
      padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
      child: Container(
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
      ),
    );
  }
}
