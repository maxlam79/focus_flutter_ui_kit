import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoButtonsTypesIcon extends StatelessWidget {
  const DemoButtonsTypesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets containerMargin = EdgeInsets.only(left: 15, right: 15, bottom: 15);
    double boxHeight = 200;

    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      margin: containerMargin,
      backgroundColor: fuiColors.shade2,
      child: SizedBox(
        height: boxHeight,
        child: FUIColumn(
          children: [
            H5(const Text('Icon Button')),
            Expanded(
              child: Center(
                child: FUIButtonLinkIcon(
                  icon: const Icon(LineAwesomeIcons.lightbulb),
                  fuiButtonSize: FUIButtonSize.large,
                  onPressed: () {},
                ),
              ),
            ),
            FUISpacer.vSpace35,
            Regular(const Text('Clickable captionless image button.')),
            FUISpacer.vSpace5,
            SmallTextI(const Text('Class: components/button/FUIButtonPlainIcon')),
          ],
        ),
      ),
    );
  }
}
