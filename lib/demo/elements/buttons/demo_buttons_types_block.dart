import 'package:flutter/material.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoButtonsTypesBlock extends StatelessWidget {
  const DemoButtonsTypesBlock({super.key});

  @override
  Widget build(BuildContext context) {
    EdgeInsets containerMargin = const EdgeInsets.only(left: 15, right: 15, bottom: 15);
    double boxHeight = 200;

    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      margin: containerMargin,
      backgroundColor: fuiColors.shade2,
      child: SizedBox(
        height: boxHeight,
        child: FUIColumn(
          children: [
            H5(const Text('Block Button')),
            Expanded(
              child: Center(
                child: FUIButtonBlockTextIcon(
                  text: const Text('Click Here'),
                  onPressed: () {},
                ),
              ),
            ),
            Regular(const Text('The not-so-boring flat button with full background color.')),
            FUISpacer.vSpace5,
            SmallTextI(const Text('Class: components/button/FUIButtonBlockTextIcon')),
          ],
        ),
      ),
    );
  }
}
