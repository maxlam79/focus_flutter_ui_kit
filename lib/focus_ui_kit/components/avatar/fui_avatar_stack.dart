import 'package:avatar_stack/avatar_stack.dart';
import 'package:avatar_stack/positions.dart';
import 'package:flutter/material.dart';

import '../../exports.dart';

class FUIAvatarStack extends StatelessWidget with FUIColorMixin {
  final FUIColorScheme fuiColorScheme;
  final List<Widget> avatars;
  final Positions? settings;
  final InfoWidgetBuilder? infoWidgetBuilder;
  final double? width;
  final double? height;

  FUIAvatarStack({
    Key? key,
    this.fuiColorScheme = FUIColorScheme.primary,
    required this.avatars,
    this.settings,
    this.infoWidgetBuilder,
    this.width,
    this.height,
  }) : super(key: key ?? UniqueKey());

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = discernColorByScheme(context, fuiColorScheme: fuiColorScheme);
    Color textColor = discernForegroundColorByScheme(context, fuiColorScheme: fuiColorScheme);

    final settings = this.settings ??
        RestrictedPositions(
          minCoverage: FUIAvatarTheme.minCoverage,
          maxCoverage: FUIAvatarTheme.maxCoverage,
        );

    final infoWidgetBuilder = this.infoWidgetBuilder ??
        (int surplus, BuildContext context) => BorderedCircleAvatar(
              backgroundColor: backgroundColor,
              border: BorderSide(
                color: backgroundColor,
                width: FUIAvatarTheme.infoBorderWidth,
              ),
              child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                    style: context.theme.fuiAvatar.tsInfo.copyWith(
                      color: textColor,
                    ),
                    child: Text('+$surplus'),
                  ),
                ),
              ),
            );

    return SizedBox(
      height: height,
      width: width,
      child: WidgetStack(
        positions: settings,
        buildInfoWidget: infoWidgetBuilder,
        stackedWidgets: avatars,
      ),
    );
  }
}
