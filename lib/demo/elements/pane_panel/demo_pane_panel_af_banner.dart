import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoPanePanelAFBanner extends StatelessWidget {
  const DemoPanePanelAFBanner({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionPlain(
      horizontalSpace: FUISectionHorizontalSpace.focus,
      backgroundColor: fuiColors.shade5.shade500,
      child: FUISectionContainer(
        child: FUIColumn(
          children: [
            H2(Text('Advance Features', style: TextStyle(color: fuiColors.shade0))),
            FUISpacer.vSpace5,
            H5(Text('Panel with progress bars and spinners while performing async process(es).', style: TextStyle(color: fuiColors.shade0))),
          ],
        ),
      ),
    );
  }
}
