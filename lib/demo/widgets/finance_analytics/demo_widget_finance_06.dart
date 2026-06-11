import 'dart:convert';

import 'package:color_shade/color_shade.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance06 extends StatelessWidget {
  const DemoWidgetFinance06({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('ANNUAL FIGURES'),
      height: responsiveValue(context, lg: 800, md: 580, sm: 780, xs: 780),
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: false,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 12,
                md: 6,
                sm: 12,
                child: _buildSec01(context),
              ),
              ResponsiveGridCol(
                lg: 12,
                md: 6,
                sm: 12,
                child: _buildSec02(context),
              ),
            ],
          ),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 12,
                child: _buildSec03(context),
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
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUIColumn(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.zero,
          child: Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 10,
            children: [
              FUITextPill(fuiColorScheme: FUIColorScheme.secondary, pillShape: FUITextPillShape.square, text: Text('NASDAQ')),
              FUITextPill(pillShape: FUITextPillShape.square, text: Text('S&P 500')),
            ],
          ),
        ),
        FUISpacer.vSpace30,
        Text('94,745,000', style: typoTheme.h1),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.only(bottom: 1),
              child: Icon(LineAwesomeIcons.arrow_alt_circle_up, size: 18, color: fuiColors.statusSuccess.shade600),
            ),
            FUISpacer.hSpace5,
            Text('+1.2%', style: typoTheme.regular.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
        FUISpacer.vSpace5,
        Regular(Text('U.S. markets open in 6h 23m')),
      ],
    );
  }

  _buildSec02(BuildContext context) {
    return Padding(
      padding: responsiveValue(
        context,
        lg: EdgeInsets.only(top: 20),
        md: EdgeInsets.zero,
        sm: EdgeInsets.only(top: 20),
        xs: EdgeInsets.only(top: 20),
      ),
      child: FUIColumn(
        children: [
          H5(Text('Annual Figures')),
          _buildDataTable(context),
        ],
      ),
    );
  }

  _buildSec03(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: _buildChart(context),
    );
  }

  _buildDataTable(BuildContext context) {
    FUIDataTableColumnHelper dtColumnHelper = FUIDataTableColumnHelper(context);
    FUIDataTableCellHelper dtCellHelper = FUIDataTableCellHelper(context);

    return SizedBox(
      height: 200, // Always have height bounded when using FUIAsyncPaginatedDataTable2
      child: FUIDataTable2(
        fuiDataTable2Size: FUIDataTable2Size.small,
        columns: [
          DataColumn2(label: dtColumnHelper.genLabel(text: 'Year', alignment: FUIDataTable2Alignment.center)),
          DataColumn2(label: dtColumnHelper.genLabel(text: 'Figure', alignment: FUIDataTable2Alignment.right)),
        ],
        rows: [
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: '2023', alignment: FUIDataTable2Alignment.center)),
              DataCell(dtCellHelper.genData(text: '96,773,000', alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: '2022', alignment: FUIDataTable2Alignment.center)),
              DataCell(dtCellHelper.genData(text: '81,462,000', alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: '2021', alignment: FUIDataTable2Alignment.center)),
              DataCell(dtCellHelper.genData(text: '53,823,000', alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: '2020', alignment: FUIDataTable2Alignment.center)),
              DataCell(dtCellHelper.genData(text: '31,536,000', alignment: FUIDataTable2Alignment.right)),
            ],
          ),
        ],
      ),
    );
  }

  _buildChart(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return SizedBox(
      height: 230,
      child: FutureBuilder(
        future: rootBundle.loadString('assets/demo-data/gpdi-us.json'),
        builder: (BuildContext context, AsyncSnapshot<String> data) {
          if (data.hasData) {
            List<dynamic> dataList = jsonDecode(data.requireData);

            return Chart(
              rebuild: false,
              data: dataList,
              variables: {
                'Year': Variable(
                  accessor: (dynamic datum) => datum['year'] as String,
                  scale: OrdinalScale(inflate: true, tickCount: 8),
                ),
                'Value (USD)': Variable(
                  accessor: (dynamic datum) => datum['value'] as double,
                  scale: LinearScale(
                    formatter: (v) {
                      var nf = NumberFormat();
                      nf.maximumFractionDigits = 2;

                      return '\$${nf.format(v)} B';
                    },
                  ),
                ),
              },
              marks: [
                LineMark(
                  color: ColorEncode(
                    value: fuiColors.primary,
                  ),
                  shape: ShapeEncode(
                    value: BasicLineShape(smooth: true),
                  ),
                ),
              ],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
              selections: {
                'tooltipMouse': PointSelection(
                  on: {
                    GestureType.hover,
                  },
                  devices: {PointerDeviceKind.mouse},
                  dim: Dim.x,
                ),
                'tooltipTouch': PointSelection(
                  on: {
                    GestureType.scaleUpdate,
                    GestureType.tapDown,
                    GestureType.longPressMoveUpdate,
                  },
                  devices: {PointerDeviceKind.touch},
                  dim: Dim.x,
                ),
              },
              tooltip: TooltipGuide(
                followPointer: [true, true],
                align: Alignment.topLeft,
              ),
              crosshair: CrosshairGuide(
                followPointer: [false, true],
              ),
              annotations: [
                RegionAnnotation(
                  values: ['2020', '2021'],
                  color: fuiColors.shade1,
                ),
              ],
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
    );
  }
}
