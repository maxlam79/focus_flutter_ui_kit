import 'dart:math';

import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:graphic/graphic.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetBusiness08 extends StatelessWidget {
  final Random rand = Random();

  DemoWidgetBusiness08({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('Sales Traffic'),
      height: 530,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: true,
      content: FUIColumn(
        children: [
          H2(Text('Revenue Analysis')),
          SmallText(Text('Last updated 25.02.2024 13:05')),
          Regular(Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
          FUISpacer.vSpace30,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildChart(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                child: _buildStats(context),
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

  _buildStats(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    Widget fieldValue(IconData iconData, String label, String value) {
      return Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(iconData, size: 55, color: fuiColors.textBody.shade600),
            ),
            FUISpacer.hSpace10,
            FUIColumn(
              children: [
                Text(label, style: typoTheme.regular.copyWith(color: fuiColors.textBody.shade400, fontWeight: FontWeight.bold)),
                Text(value, style: typoTheme.h2),
              ],
            ),
          ],
        ),
      );
    }

    return Padding(
      padding: responsiveValue(context, md: EdgeInsets.only(left: 20), sm: EdgeInsets.only(top: 20), xs: EdgeInsets.only(top: 20)),
      child: FUIColumn(
        children: [
          fieldValue(Boxicons.bx_sun, 'Peak Days', 'Tue - Thu'),
          fieldValue(Boxicons.bx_time, 'Peak Hours', '15:00 - 16:00'),
          fieldValue(Boxicons.bx_dollar, 'Highest Transaction Value', '7,584,393'),
          fieldValue(Boxicons.bx_chart, 'Highest Transaction Volume', '10,000,392'),
        ],
      ),
    );
  }

  _buildChart(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return SizedBox(
      height: 270,
      child: Chart(
        data: _headmapData(),
        variables: {
          'time': Variable(
            accessor: (List datum) => datum[0].toString(),
          ),
          'day': Variable(
            accessor: (List datum) => datum[1].toString(),
          ),
          'sales': Variable(
            accessor: (List datum) => datum[2] as num,
          ),
        },
        marks: [
          PolygonMark(
            color: ColorEncode(
              variable: 'sales',
              values: [
                fuiColors.primary.shade50,
                fuiColors.primary.shade100,
                fuiColors.primary.shade200,
                fuiColors.primary.shade300,
                fuiColors.primary.shade400,
                fuiColors.primary.shade500,
                fuiColors.primary.shade600,
                fuiColors.primary.shade700,
                fuiColors.primary.shade800,
                fuiColors.primary.shade900,
                fuiColors.primary,
              ],
            ),
          )
        ],
        axes: [
          Defaults.horizontalAxis,
          Defaults.verticalAxis,
        ],
        selections: {'tap': PointSelection()},
        tooltip: TooltipGuide(),
      ),
    );
  }

  _headmapData() {
    return [
      ['8:00', 'Sun', _randSalesValue(0, 10000)],
      ['9:00', 'Sun', _randSalesValue(10000, 20000)],
      ['10:00', 'Sun', _randSalesValue(20000, 300000)],
      ['11:00', 'Sun', _randSalesValue(20000, 300000)],
      ['12:00', 'Sun', _randSalesValue(20000, 300000)],
      ['13:00', 'Sun', _randSalesValue(20000, 300000)],
      ['14:00', 'Sun', _randSalesValue(20000, 300000)],
      ['15:00', 'Sun', _randSalesValue(10000, 20000)],
      ['16:00', 'Sun', _randSalesValue(0, 10000)],
      ['8:00', 'Mon', _randSalesValue(100000, 200000)],
      ['9:00', 'Mon', _randSalesValue(200000, 300000)],
      ['10:00', 'Mon', _randSalesValue(300000, 400000)],
      ['11:00', 'Mon', _randSalesValue(400000, 500000)],
      ['12:00', 'Mon', _randSalesValue(500000, 600000)],
      ['13:00', 'Mon', _randSalesValue(600000, 700000)],
      ['14:00', 'Mon', _randSalesValue(700000, 800000)],
      ['15:00', 'Mon', _randSalesValue(600000, 700000)],
      ['16:00', 'Mon', _randSalesValue(500000, 600000)],
      ['8:00', 'Tue', _randSalesValue(100000, 200000)],
      ['9:00', 'Tue', _randSalesValue(200000, 300000)],
      ['10:00', 'Tue', _randSalesValue(300000, 400000)],
      ['11:00', 'Tue', _randSalesValue(400000, 500000)],
      ['12:00', 'Tue', _randSalesValue(500000, 600000)],
      ['13:00', 'Tue', _randSalesValue(600000, 700000)],
      ['14:00', 'Tue', _randSalesValue(700000, 800000)],
      ['15:00', 'Tue', _randSalesValue(600000, 700000)],
      ['16:00', 'Tue', _randSalesValue(500000, 600000)],
      ['8:00', 'Wed', _randSalesValue(100000, 200000)],
      ['9:00', 'Wed', _randSalesValue(200000, 300000)],
      ['10:00', 'Wed', _randSalesValue(300000, 400000)],
      ['11:00', 'Wed', _randSalesValue(400000, 500000)],
      ['12:00', 'Wed', _randSalesValue(500000, 600000)],
      ['13:00', 'Wed', _randSalesValue(600000, 700000)],
      ['14:00', 'Wed', _randSalesValue(700000, 800000)],
      ['15:00', 'Wed', _randSalesValue(600000, 700000)],
      ['16:00', 'Wed', _randSalesValue(500000, 600000)],
      ['8:00', 'Thu', _randSalesValue(100000, 200000)],
      ['9:00', 'Thu', _randSalesValue(200000, 300000)],
      ['10:00', 'Thu', _randSalesValue(300000, 400000)],
      ['11:00', 'Thu', _randSalesValue(400000, 500000)],
      ['12:00', 'Thu', _randSalesValue(500000, 600000)],
      ['13:00', 'Thu', _randSalesValue(600000, 700000)],
      ['14:00', 'Thu', _randSalesValue(700000, 800000)],
      ['15:00', 'Thu', _randSalesValue(600000, 700000)],
      ['16:00', 'Thu', _randSalesValue(500000, 600000)],
      ['8:00', 'Fri', _randSalesValue(100000, 200000)],
      ['9:00', 'Fri', _randSalesValue(200000, 300000)],
      ['10:00', 'Fri', _randSalesValue(300000, 400000)],
      ['11:00', 'Fri', _randSalesValue(400000, 500000)],
      ['12:00', 'Fri', _randSalesValue(500000, 600000)],
      ['13:00', 'Fri', _randSalesValue(600000, 700000)],
      ['14:00', 'Fri', _randSalesValue(700000, 800000)],
      ['15:00', 'Fri', _randSalesValue(600000, 700000)],
      ['16:00', 'Fri', _randSalesValue(500000, 600000)],
      ['8:00', 'Sat', _randSalesValue(0, 10000)],
      ['9:00', 'Sat', _randSalesValue(10000, 20000)],
      ['10:00', 'Sat', _randSalesValue(20000, 300000)],
      ['11:00', 'Sat', _randSalesValue(20000, 300000)],
      ['12:00', 'Sat', _randSalesValue(20000, 300000)],
      ['13:00', 'Sat', _randSalesValue(20000, 300000)],
      ['14:00', 'Sat', _randSalesValue(20000, 300000)],
      ['15:00', 'Sat', _randSalesValue(10000, 20000)],
      ['16:00', 'Sat', _randSalesValue(0, 10000)],
    ];
  }

  int _randSalesValue(int min, int max) {
    return min + rand.nextInt(max - min);
  }
}
