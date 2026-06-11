import 'dart:convert';

import 'package:color_shade/color_shade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance01 extends StatelessWidget {
  const DemoWidgetFinance01({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('LARGEST MARKET CAP.'),
      height: responsiveValue(context, md: FUIPanelTheme.defaultHeight, xs: 720),
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: false,
      content: FUIColumn(
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 5,
                child: _buildSec01(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 7,
                child: _buildSec02(context),
              ),
            ],
          ),
          FUISpacer.vSpace20,
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
        SmallText(Text('Data gathered on 13/05/23')),
        SizedBox(
          height: responsiveValue(context, md: 60, sm: 20, xs: 20),
        ),
        Text('3.8%', style: typoTheme.h1),
        FUIRow(
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
        FUISpacer.vSpace10,
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
      ],
    );
  }

  _buildSec02(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUIColumn(
      children: [
        H2(Text('Q3 2024')),
        FUISpacer.vSpace15,
        SizedBox(
          height: 150,
          child: FutureBuilder(
            future: rootBundle.loadString('assets/demo-data/marketcap.json'),
            builder: (BuildContext context, AsyncSnapshot<String> data) {
              if (data.hasData) {
                List<dynamic> dataList = jsonDecode(data.requireData);

                return Chart(
                  data: dataList,
                  variables: {
                    'company': Variable(
                      accessor: (dynamic datum) => datum['company'] as String,
                    ),
                    'marketCap': Variable(
                      accessor: (dynamic datum) => datum['marketCap'] as double,
                      scale: LinearScale(
                        formatter: (v) {
                          var nf = NumberFormat();
                          nf.maximumFractionDigits = 3;

                          return '\$${nf.format(v)} T';
                        },
                      ),
                    ),
                  },
                  marks: [
                    IntervalMark(
                      label: LabelEncode(
                        encoder: (tuple) {
                          var marketCap = double.parse(tuple['marketCap'].toString());
                          var nf = NumberFormat();
                          nf.maximumFractionDigits = 3;

                          return Label('  \$${nf.format(marketCap)} T');
                        },
                      ),
                      color: ColorEncode(
                        encoder: (tuple) {
                          var company = tuple['company'].toString();

                          if (company == 'Microsoft') {
                            return fuiColors.primary;
                          }

                          return fuiColors.shade2;
                        },
                      ),
                    ),
                  ],
                  coord: RectCoord(transposed: true),
                  axes: [
                    Defaults.verticalAxis
                      ..line = Defaults.strokeStyle
                      ..grid = null,
                    Defaults.horizontalAxis
                      ..line = null
                      ..grid = Defaults.strokeStyle,
                  ],
                  selections: {'tap': PointSelection(dim: Dim.x)},
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
      ],
    );
  }

  _buildSec03(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        H1(Text('11T')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('MARKET VALUE', style: TextStyle(fontWeight: FontWeight.w900)), padding: EdgeInsets.zero),
              SmallText(Text('Combine Total'), padding: EdgeInsets.zero),
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
        H1(Text('100B')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('REVENUE', style: TextStyle(fontWeight: FontWeight.w900)), padding: EdgeInsets.zero),
              SmallText(Text('Combine Total'), padding: EdgeInsets.zero),
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
        H1(Text('18%')),
        FUISpacer.hSpace5,
        Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Regular(Text('GROWTH', style: TextStyle(fontWeight: FontWeight.w900)), padding: EdgeInsets.zero),
              SmallText(Text('Annual'), padding: EdgeInsets.zero),
            ],
          ),
        ),
      ],
    );
  }
}
