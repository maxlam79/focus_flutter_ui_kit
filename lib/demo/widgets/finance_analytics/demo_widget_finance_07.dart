import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance07 extends StatelessWidget {
  const DemoWidgetFinance07({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUIPanel(
      headerShow: true,
      header: Text('RATIOS'),
      height: 800,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: true,
      content: FUIColumn(
        children: [
          _buildChart(context),
          PreH(Text('Key Ratios')),
          FUISpacer.vSpace7,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H3(Text('1.7259', style: TextStyle(color: fuiColors.primary)),
                        padding: EdgeInsets.zero),
                    Regular(
                        Text(
                          'CURRENT RATIO',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        padding: EdgeInsets.zero),
                  ],
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H3(Text('4.31%', style: TextStyle(color: fuiColors.primary)),
                        padding: EdgeInsets.zero),
                    Regular(
                        Text(
                          'LONG TERM DEBT / CAPITAL',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        padding: EdgeInsets.zero),
                  ],
                ),
              ),
            ],
          ),
          FUISpacer.vSpace20,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H3(Text('18.2489', style: TextStyle(color: fuiColors.primary)),
                        padding: EdgeInsets.zero),
                    Regular(
                        Text(
                          'GROSS MARGIN',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        padding: EdgeInsets.zero),
                  ],
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    H3(Text('9.1875', style: TextStyle(color: fuiColors.primary)),
                        padding: EdgeInsets.zero),
                    Regular(
                        Text(
                          'OPERATING MARGIN',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        padding: EdgeInsets.zero),
                  ],
                ),
              ),
            ],
          ),
          FUISpacer.vSpace20,
          H4(Text('Thesis')),
          Regular(Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.')),
        ],
      ),
      footerShow: true,
      footerSeparator: true,
      footerButtons: [
        FUIButtonBlockTextIcon(
            icon: Icon(LineAwesomeIcons.search_plus_solid),
            text: Text('Details'),
            onPressed: () {}),
      ],
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

  _buildChart(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    NumberFormat valueNf = NumberFormat('#,###');

    return SizedBox(
      height: 300,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: rootBundle.loadString('assets/demo-data/goods-services.json'),
          builder: (BuildContext context, AsyncSnapshot<String> data) {
            if (data.hasData) {
              List<dynamic> dataList = jsonDecode(data.requireData);

              return Chart(
                data: dataList,
                variables: {
                  'period': Variable(
                    accessor: (dynamic datum) => datum['period'].toString(),
                    scale: OrdinalScale(
                      title: 'Quarter',
                    ),
                  ),
                  'type': Variable(
                    accessor: (dynamic datum) => datum['type'] as String,
                    scale: OrdinalScale(
                      title: 'Type',
                    ),
                  ),
                  'value': Variable(
                    accessor: (dynamic datum) => datum['value'] as num,
                    scale: LinearScale(
                        title: 'Value',
                        formatter: (v) {
                          return '\$${valueNf.format(v)} B';
                        }),
                  ),
                },
                marks: [
                  LineMark(
                    position: Varset('period') * Varset('value') / Varset('type'),
                    shape: ShapeEncode(value: BasicLineShape(loop: true)),
                    color: ColorEncode(
                      variable: 'type',
                      values: fuiColors.colorGrp1,
                    ),
                  ),
                ],
                coord: PolarCoord(),
                axes: [
                  Defaults.circularAxis,
                  Defaults.radialAxis,
                ],
                selections: {
                  'touchMove': PointSelection(
                    on: {
                      GestureType.scaleUpdate,
                      GestureType.tapDown,
                      GestureType.longPressMoveUpdate
                    },
                    dim: Dim.x,
                    variable: 'period',
                  )
                },
                tooltip: TooltipGuide(
                  anchor: (_) => Offset.zero,
                  align: Alignment.bottomRight,
                  multiTuples: true,
                  variables: ['type', 'value'],
                ),
                crosshair: CrosshairGuide(followPointer: [false, true]),
              );
            } else {
              return Center(
                child: FUISpinner(
                  enable: true,
                  rotationEnable: false,
                  spinnerWidget: Lottie.asset(
                    'assets/lottie/spinner01.json',
                    width: FUISpinnerTheme.defaultSize,
                    height: FUISpinnerTheme.defaultSize,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
