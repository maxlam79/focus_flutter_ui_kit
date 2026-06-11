import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoButtonsSizesIcon extends StatelessWidget {
  const DemoButtonsSizesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H5(Text('Plain Icon Button Sizes')),
          FUISpacer.vSpace20,
          FUIButtonLinkIcon(
            icon: Icon(LineAwesomeIcons.check_double_solid),
            fuiButtonSize: FUIButtonSize.large,
            onPressed: () {},
          ),
          FUISpacer.vSpace20,
          FUIButtonLinkIcon(
            icon: Icon(LineAwesomeIcons.check_double_solid),
            fuiButtonSize: FUIButtonSize.medium,
            onPressed: () {},
          ),
          FUISpacer.vSpace20,
          FUIButtonLinkIcon(
            icon: Icon(LineAwesomeIcons.check_double_solid),
            fuiButtonSize: FUIButtonSize.small,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
