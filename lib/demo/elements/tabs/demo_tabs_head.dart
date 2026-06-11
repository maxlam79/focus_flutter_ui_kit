import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoTabsHead extends StatelessWidget {
  const DemoTabsHead({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionPlain(
      horizontalSpace: FUISectionHorizontalSpace.focus,
      child: Column(
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 3,
                md: 12,
                sm: 12,
                child: FUISectionContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      H2(const Text('Tabs')),
                      FUISpacer.vSpace10,
                      H5(const Text('Switchable content pane via ‘tapping’ on the header.')),
                      FUISpacer.vSpace10,
                      Regular(const Text('Content display animation is configurable. Please try.')),
                    ],
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 9,
                md: 12,
                sm: 12,
                child: ResponsiveGridRow(
                  children: [
                    ResponsiveGridCol(
                      sm: 12,
                      md: 6,
                      child: _buildContent(context, 'Tab (Header on Top Left)', FUITabHeadPosition.topLeft, 0),
                    ),
                    ResponsiveGridCol(
                      sm: 12,
                      md: 6,
                      child: _buildContent(context, 'Tab (Header on Bottom Right)', FUITabHeadPosition.bottomRight, 1),
                    ),
                    ResponsiveGridCol(
                      sm: 12,
                      md: 6,
                      child: _buildContent(context, 'Tab (Header on Left Top)', FUITabHeadPosition.leftTop, 2),
                    ),
                    ResponsiveGridCol(
                      sm: 12,
                      md: 6,
                      child: _buildContent(context, 'Tab (Header on Right Bottom)', FUITabHeadPosition.rightBottom, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildContent(BuildContext context, String headerTitle, FUITabHeadPosition tabHeadPosition, int initialSelectedIndex) {
    return FUISectionContainer(
      child: FUIPanel(
        header: Text(headerTitle),
        headerShow: true,
        headerSeparator: true,
        height: responsiveValue(context, lg: 440, md: 450, xs: 450),
        content: FUITabPane(
          fuiTabHeadPosition: tabHeadPosition,
          height: responsiveValue(context, lg: 350, md: 360, xs: 360),
          fuiTabItems: [
            FUITabItem(
              initialSelected: initialSelectedIndex == 0 ? true : false,
              tabHeadLabel: Text('Tab 1'),
              content: DemoTabsContent01(),
            ),
            FUITabItem(
              initialSelected: initialSelectedIndex == 1 ? true : false,
              tabHeadLabel: Text('Tab 2'),
              content: DemoTabsContent02(),
            ),
            FUITabItem(
              initialSelected: initialSelectedIndex == 3 ? true : false,
              tabHeadLabel: Text('Tab 3'),
              content: DemoTabsContent03(),
            ),
          ],
        ),
      ),
    );
  }
}
