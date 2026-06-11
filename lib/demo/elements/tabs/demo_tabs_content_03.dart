import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoTabsContent03 extends StatelessWidget {
  const DemoTabsContent03({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    List<Map<String, dynamic>> chartData = [
      {'month': 'Jul', 'value': 233.596, 'highlight': false},
      {'month': 'Aug', 'value': 233.877, 'highlight': false},
      {'month': 'Sep', 'value': 234.149, 'highlight': true},
      {'month': 'Oct', 'value': 233.546, 'highlight': false},
      {'month': 'Nov', 'value': 233.069, 'highlight': false},
      {'month': 'Dec', 'value': 233.049, 'highlight': false},
    ];

    return FUIColumn(
      children: [
        FUISingleChildScrollView(
          child: FUIColumn(
            children: [
              PreH(const Text('Bar Chart')),
              H5(const Text('US CPI (2013 - Q3 & Q4)')),
              FUISpacer.vSpace10,
              Center(
                child: SizedBox(
                  width: 600,
                  height: 200,
                  child: Chart(
                    rebuild: false,
                    data: chartData,
                    variables: {
                      'month': Variable(
                        accessor: (Map map) => map['month'] as String,
                      ),
                      'cpi': Variable(
                        accessor: (Map map) => map['value'] as num,
                        scale: LinearScale(min: 200, max: 240),
                      ),
                    },
                    marks: [
                      IntervalMark(
                        transition: Transition(
                            duration: const Duration(seconds: 1), curve: Curves.linearToEaseOut),
                        entrance: {MarkEntrance.y},
                        label: LabelEncode(encoder: (tuple) => Label(tuple['cpi'].toString())),
                        tag: (tuple) => tuple['month'].toString(),
                        color: ColorEncode(
                          encoder: (tuple) {
                            var itr = tuple.entries.iterator;

                            while (itr.moveNext()) {
                              if (itr.current.key == 'month' && itr.current.value == 'Sep') {
                                return fuiColors.primary;
                              } else {
                                return fuiColors.shade2;
                              }
                            }

                            return fuiColors.shade2;
                          },
                        ),
                      ),
                    ],
                    axes: [
                      Defaults.horizontalAxis,
                      Defaults.verticalAxis,
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
