import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../focus_ui_kit/exports.dart';
import 'demo_timeline_data.dart';

class DemoTimeLineWithIcon extends StatelessWidget {
  DemoTimeLineWithIcon({super.key});

  /// Mock Data
  final DemoTimelineData timelineData = DemoTimelineData();

  /// Attributes & Flags
  final double lineXY = 0.2;
  final double indicatorWidth = 90;
  final double indicatorHeight = 50;
  final EdgeInsets indicatorPadding = FUITimelineTileTheme.defaultIndicatorPaddingMedium;

  @override
  Widget build(BuildContext context) {
    /// Take note of the responsive content generation for md and above, sm & xs.
    TimelineAlign responsiveTLAlign = responsiveValue(context,
        md: TimelineAlign.manual, sm: TimelineAlign.start, xs: TimelineAlign.start);
    double? responsiveLineXY = responsiveValue(context, md: lineXY, sm: null, xs: null);

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H2(const Text('With Icon')),
          Regular(const Text(
              'Indicators can be customized, you may insert an icon button or some other widgets.')),
          FUISpacer.vSpace20,
          FUITimelineTile(
            fuiTimelineSize: FUITimelineSize.medium,
            alignment: responsiveTLAlign,
            lineXY: responsiveLineXY,
            hasIndicator: true,
            indicatorStyle: IndicatorStyle(
              indicator: Center(
                  child: FUIButtonBlockCircleIcon(
                fuiButtonSize: FUIButtonSize.small,
                icon: const Icon(LineAwesomeIcons.check_solid),
                onPressed: () {},
              )),
              padding: indicatorPadding,
              height: indicatorHeight,
              width: indicatorWidth,
            ),
            startChild: _buildStartChildResponsive(context, timelineData.timeline01Date),
            endChild: _buildEndChildResponsive(
                context, timelineData.timeline01Date, timelineData.timeline01Content),
          ),
          FUITimelineTile(
            fuiTimelineSize: FUITimelineSize.medium,
            alignment: responsiveTLAlign,
            lineXY: responsiveLineXY,
            hasIndicator: true,
            indicatorStyle: IndicatorStyle(
              indicator: Center(
                  child: FUIButtonBlockCircleIcon(
                fuiButtonSize: FUIButtonSize.small,
                fuiColorScheme: FUIColorScheme.secondary,
                icon: const Icon(LineAwesomeIcons.edit),
                onPressed: () {},
              )),
              padding: indicatorPadding,
              height: indicatorHeight,
              width: indicatorWidth,
            ),
            startChild: _buildStartChildResponsive(context, timelineData.timeline02Date),
            endChild: _buildEndChildResponsive(
                context, timelineData.timeline02Date, timelineData.timeline02Content),
          ),
          FUITimelineTile(
            fuiTimelineSize: FUITimelineSize.medium,
            alignment: responsiveTLAlign,
            lineXY: responsiveLineXY,
            hasIndicator: true,
            indicatorStyle: IndicatorStyle(
              indicator: Center(
                  child: FUIButtonBlockCircleIcon(
                fuiButtonSize: FUIButtonSize.small,
                icon: const Icon(LineAwesomeIcons.search_solid),
                onPressed: () {},
              )),
              padding: indicatorPadding,
              height: indicatorHeight,
              width: indicatorWidth,
            ),
            startChild: _buildStartChildResponsive(context, timelineData.timeline03Date),
            endChild: _buildEndChildResponsive(
                context, timelineData.timeline03Date, timelineData.timeline03Content),
          ),
          FUITimelineTile(
            fuiTimelineSize: FUITimelineSize.medium,
            alignment: responsiveTLAlign,
            lineXY: responsiveLineXY,
            hasIndicator: true,
            indicatorStyle: IndicatorStyle(
              indicator: Center(
                  child: FUIButtonBlockCircleIcon(
                fuiButtonSize: FUIButtonSize.small,
                fuiColorScheme: FUIColorScheme.secondary,
                icon: const Icon(LineAwesomeIcons.clock),
                onPressed: () {},
              )),
              padding: indicatorPadding,
              height: indicatorHeight,
              width: indicatorWidth,
            ),
            startChild: _buildStartChildResponsive(context, timelineData.timeline04Date),
            endChild: _buildEndChildResponsive(
                context, timelineData.timeline04Date, timelineData.timeline04Content),
          ),
        ],
      ),
    );
  }

  _buildStartChildResponsive(BuildContext context, Widget timeLineDate) {
    return responsiveValue(context, md: timeLineDate, sm: null, xs: null);
  }

  _buildEndChildResponsive(BuildContext context, Widget timeLineDate, Widget timeLineContent) {
    Widget xsWidget = FUIColumn(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 18),
          child: timeLineDate,
        ),
        timeLineContent,
      ],
    );

    Widget mdWidget = timeLineContent;

    return responsiveValue(context, md: mdWidget, sm: xsWidget, xs: xsWidget);
  }
}
