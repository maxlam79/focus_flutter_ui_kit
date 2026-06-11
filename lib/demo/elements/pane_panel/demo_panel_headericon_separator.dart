import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoPanelHeaderIconWithSeparator extends StatelessWidget {
  const DemoPanelHeaderIconWithSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    FUIPanelTheme fuiPanelTheme = context.theme.fuiPanel;

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H4(const Text('With Separator')),
          FUISpacer.vSpace8,
          FUIPanel(
            header: const Text('PANEL TITLE'),
            height: 220,
            // ** Optional, but to make it standardize among the row, just have a height value.
            headerSeparator: true,
            headerIconButtons: [
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.external_link_alt_solid,
                  size: FUIPanelTheme.headerIconButtonSize,
                  color: fuiPanelTheme.headerIconButtonColor,
                ),
                onPressed: () {},
              ),
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.edit,
                  size: FUIPanelTheme.headerIconButtonSize,
                  color: fuiPanelTheme.headerIconButtonColor,
                ),
                onPressed: () {},
              ),
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.trash_alt,
                  size: FUIPanelTheme.headerIconButtonSize,
                  color: fuiPanelTheme.headerIconButtonColor,
                ),
                onPressed: () {},
              ),
            ],
            content: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                H5(const Text('Panel Demo Content')),
                Regular(
                    const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
