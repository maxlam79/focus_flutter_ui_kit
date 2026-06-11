import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoButtonsSizesOutline extends StatelessWidget {
  const DemoButtonsSizesOutline({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H5(Text('Outlined Button Sizes')),
          FUISpacer.vSpace20,
          FUIButtonOutlinedTextIcon(
            text: Text('LARGE', overflow: TextOverflow.ellipsis),
            icon: Icon(LineAwesomeIcons.check_double_solid),
            fuiButtonSize: FUIButtonSize.large,
            onPressed: () {},
          ),
          FUISpacer.vSpace20,
          FUIButtonOutlinedTextIcon(
            text: Text('Medium (Default)', overflow: TextOverflow.ellipsis),
            icon: Icon(LineAwesomeIcons.check_solid),
            fuiButtonSize: FUIButtonSize.medium,
            onPressed: () {},
          ),
          FUISpacer.vSpace20,
          FUIButtonOutlinedTextIcon(
            text: Text('small', overflow: TextOverflow.ellipsis),
            icon: Icon(LineAwesomeIcons.check_circle),
            fuiButtonSize: FUIButtonSize.small,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
