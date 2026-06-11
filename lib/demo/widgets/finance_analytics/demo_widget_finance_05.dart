import 'dart:convert';

import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:color_shade/color_shade.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:graphic/graphic.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance05 extends StatelessWidget {
  const DemoWidgetFinance05({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('PIE CHART'),
      height: responsiveValue(context, lg: 800, md: 450, sm: 800, xs: 800),
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: false,
      content: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            sm: 12,
            md: 5,
            lg: 12,
            child: _buildSec01(context),
          ),
          ResponsiveGridCol(
            sm: 12,
            md: 7,
            lg: 12,
            child: _buildSec02(context),
          ),
        ],
      ),
      footerShow: true,
      footerSeparator: false,
      footer: FUIButtonBlockTextIcon(
        fuiButtonBlockLevel: FUIButtonBlockLevel.full,
        text: Text('View Details'),
        onPressed: () {},
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

    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SizedBox(
          height: 250,
          child: FutureBuilder(
            future: rootBundle.loadString('assets/demo-data/allocation-perc.json'),
            builder: (BuildContext context, AsyncSnapshot<String> data) {
              if (data.hasData) {
                List<dynamic> dataList = jsonDecode(data.requireData);

                return Chart(
                  data: dataList,
                  variables: {
                    'asset': Variable(
                      accessor: (dynamic datum) => datum['asset'] as String,
                      scale: OrdinalScale(
                        title: 'Asset Class',
                      ),
                    ),
                    'perc': Variable(
                      accessor: (dynamic datum) => datum['allocationPerc'] as double,
                      scale: LinearScale(
                        title: '%',
                      ),
                    ),
                  },
                  transforms: [
                    Proportion(
                      variable: 'perc',
                      as: 'percent',
                    ),
                  ],
                  marks: [
                    IntervalMark(
                      position: Varset('percent') / Varset('asset'),
                      label: LabelEncode(
                        encoder: (tuple) {
                          var label = '${tuple['perc'].toString()} %';

                          return Label(
                            label,
                            LabelStyle(textStyle: Defaults.runeStyle),
                          );
                        },
                      ),
                      color: ColorEncode(
                        encoder: (tuple) {
                          var asset = tuple['asset'].toString();

                          if (asset == 'Stocks') {
                            return fuiColors.primary;
                          } else if (asset == 'Bonds') {
                            return fuiColors.shade4;
                          } else if (asset == 'Forex' || asset == 'Metal') {
                            return fuiColors.shade3;
                          } else {
                            return fuiColors.shade2;
                          }
                        },
                      ),
                      modifiers: [StackModifier()],
                      // entrance: {MarkEntrance.y},
                      elevation: ElevationEncode(
                        value: 3,
                      ),
                    )
                  ],
                  coord: PolarCoord(transposed: true, dimCount: 1),
                  selections: {
                    'tooltipMouse': PointSelection(
                      on: {
                        GestureType.hover,
                      },
                      devices: {PointerDeviceKind.mouse},
                      dim: Dim.y,
                    ),
                    'tooltipTouch': PointSelection(
                      on: {
                        GestureType.scaleUpdate,
                        GestureType.tapDown,
                        GestureType.longPressMoveUpdate,
                      },
                      devices: {PointerDeviceKind.touch},
                      dim: Dim.y,
                    ),
                  },
                  tooltip: TooltipGuide(
                    followPointer: [false, true],
                    align: Alignment.topLeft,
                    variables: ['asset'],
                  ),
                  crosshair: CrosshairGuide(
                    followPointer: [false, true],
                  ),
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
      ),
    );
  }

  _buildSec02(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Boxicons.bx_pie_chart, size: 60),
            FUISpacer.hSpace20,
            FUIColumn(
              children: [
                Text('Segmentation', style: typoTheme.regular.copyWith(fontSize: responsiveValue(context, md: 36, sm: 26, xs: 26), fontWeight: FontWeight.w800)),
                Text('Market Outlook', style: typoTheme.regular.copyWith(color: fuiColors.primary, fontSize: 16, fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
        FUISpacer.vSpace20,
        _buildLabelAndValue(context, 'Stock', true, '13.3%'),
        _buildLabelAndValue(context, 'Metal', false, '8.9%'),
        _buildLabelAndValue(context, 'Institution', false, '3.0%'),
        _buildLabelAndValue(context, 'Retail', true, '15.6%'),
        _buildLabelAndValue(context, 'Largest Market Share', true, '23.7%'),
      ],
    );
  }

  _buildLabelAndValue(BuildContext context, String fieldLabel, bool up, String fieldValue) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    double commonFontSize = 18;

    TextStyle labelTs = typoTheme.defaultTextStyle.copyWith(color: fuiColors.textHinted, fontSize: commonFontSize, fontWeight: FontWeight.bold);
    TextStyle valueTs = up
        ? typoTheme.defaultTextStyle.copyWith(color: fuiColors.statusSuccess.shade600, fontSize: commonFontSize, fontWeight: FontWeight.bold)
        : typoTheme.defaultTextStyle.copyWith(color: fuiColors.statusError.shade600, fontSize: commonFontSize, fontWeight: FontWeight.bold);

    return Padding(
      padding: EdgeInsets.all(10.0),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            sm: 9,
            xs: 6,
            child: Text(fieldLabel, style: labelTs),
          ),
          ResponsiveGridCol(
            sm: 1,
            xs: 3,
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(up ? BootstrapIcons.caret_up_fill : BootstrapIcons.caret_down_fill, size: commonFontSize, color: valueTs.color),
            )),
          ),
          ResponsiveGridCol(
            sm: 2,
            xs: 3,
            child: Text(fieldValue, style: valueTs),
          ),
        ],
      ),
    );
  }
}
