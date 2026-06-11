import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:graphic/graphic.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetFinance04 extends StatelessWidget {
  const DemoWidgetFinance04({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUIPanel(
      headerShow: true,
      header: Text('Income'),
      height: responsiveValue(context, md: FUIPanelTheme.defaultHeight, xs: 720),
      headerIconButtons: _buildHeaderIconButtons(context),
      content: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            sm: 12,
            md: 6,
            child: FUIColumn(
              children: [
                H1(Text('2,394,309')),
                Regular(Text('CONSOLIDATED Q3 2024', style: TextStyle(color: fuiColors.primary, fontWeight: FontWeight.w700))),
                FUISpacer.vSpace10,
                _buildChart(context),
              ],
            ),
          ),
          ResponsiveGridCol(
            sm: 0,
            md: 1,
            child: const SizedBox.shrink(),
          ),
          ResponsiveGridCol(
            sm: 12,
            md: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H5(Text('Highlights')),
                _buildAccordionDetails(context),
              ],
            ),
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

  _buildAccordionDetails(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    TextStyle labelTs = typoTheme.regular.copyWith(color: fuiColors.secondary);
    TextStyle descTs = typoTheme.smallText.copyWith(color: fuiColors.shade3);
    TextStyle valueTs = typoTheme.regular.copyWith(fontWeight: FontWeight.bold, fontSize: 18);

    Widget buildLabelAndValue(String label, String desc, String value) {
      return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DefaultTextStyle(style: labelTs, child: Text(label)),
                DefaultTextStyle(style: descTs, child: Text(desc)),
              ],
            ),
            DefaultTextStyle(style: valueTs, child: Text(value)),
          ],
        ),
      );
    }

    return FUIAccordion(
      fuiAccordionItems: [
        FUIAccordionItem(
          initialExpanded: true,
          contentHeight: 130,
          sideDecoExpAniIconEnable: true,
          headLabel: Text('Key Indicators'),
          content: FUISingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLabelAndValue('Metric 01', 'Metric Description', '2,392,302'),
                buildLabelAndValue('Metric 02', 'Metric Description', '4,394,203'),
                buildLabelAndValue('Metric 03', 'Metric Description', '2,304,394'),
              ],
            ),
          ),
        ),
        FUIAccordionItem(
          contentHeight: 130,
          sideDecoExpAniIconEnable: true,
          headLabel: Text('Compliance'),
          content: FUISingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLabelAndValue('Metric 01', 'Metric Description', '2,392,302'),
                buildLabelAndValue('Metric 02', 'Metric Description', '4,394,203'),
                buildLabelAndValue('Metric 03', 'Metric Description', '2,304,394'),
              ],
            ),
          ),
        ),
        FUIAccordionItem(
          contentHeight: 130,
          sideDecoExpAniIconEnable: true,
          headLabel: Text('Risk'),
          content: FUISingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildLabelAndValue('Metric 01', 'Metric Description', '2,392,302'),
                buildLabelAndValue('Metric 02', 'Metric Description', '4,394,203'),
                buildLabelAndValue('Metric 03', 'Metric Description', '2,304,394'),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildChart(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return SizedBox(
      height: 200,
      child: FutureBuilder(
        future: rootBundle.loadString('assets/demo-data/gdi-us.json'),
        builder: (BuildContext context, AsyncSnapshot<String> data) {
          if (data.hasData) {
            List<dynamic> dataList = jsonDecode(data.requireData);

            // Just take the most recent 10 of it
            dataList = dataList.sublist(dataList.length - 10, dataList.length - 1);

            return Chart(
              data: dataList,
              variables: {
                'Year': Variable(
                  accessor: (dynamic datum) => datum['year'] as String,
                  scale: OrdinalScale(inflate: false, tickCount: 8),
                ),
                'GDI (USD)': Variable(
                  accessor: (dynamic datum) => datum['value'] as double,
                  scale: LinearScale(
                    formatter: (v) {
                      var nf = NumberFormat('#,###');
                      nf.maximumFractionDigits = 1;

                      return '\$${nf.format(v)} B';
                    },
                  ),
                ),
              },
              marks: [
                IntervalMark(
                  elevation: ElevationEncode(value: 0, updaters: {
                    'tap': {true: (_) => 5}
                  }),
                  color: ColorEncode(
                    value: fuiColors.primary,
                    updaters: {
                      'tap': {false: (color) => color.withAlpha(100)}
                    },
                  ),
                  transition: Transition(
                    duration: Duration(milliseconds: 300),
                  ),
                ),
              ],
              axes: [
                Defaults.horizontalAxis,
                Defaults.verticalAxis,
              ],
              selections: {
                'tap': PointSelection(dim: Dim.x),
              },
              tooltip: TooltipGuide(),
              crosshair: CrosshairGuide(),
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
