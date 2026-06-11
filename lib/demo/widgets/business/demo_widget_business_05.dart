import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetBusiness05 extends StatelessWidget {
  const DemoWidgetBusiness05({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('TASK LIST'),
      height: 700,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: true,
      content: FUIColumn(
        children: _buildTaskList(context),
      ),
    );
  }

  _buildHeaderIconButtons(BuildContext context) {
    FUIPanelTheme panelTheme = context.theme.fuiPanel;

    var mdList = [
      FUIButtonLinkIcon(
        icon: Icon(
          LineAwesomeIcons.external_link_alt_solid,
          size: FUIPanelTheme.headerIconButtonSize,
          color: panelTheme.headerIconButtonColor,
        ),
        onPressed: () {},
      ),
      FUIButtonLinkIcon(
        icon: Icon(
          LineAwesomeIcons.sync_alt_solid,
          size: FUIPanelTheme.headerIconButtonSize,
          color: panelTheme.headerIconButtonColor,
        ),
        onPressed: () {},
      ),
    ];

    var smList = [
      FUIPopupMenuIconButton(fuiPopupMenuItemList: [
        FUIPopupMenuItem(
          label: Text('Explore'),
          icon: Icon(LineAwesomeIcons.external_link_alt_solid),
        ),
        FUIPopupMenuItem(
          label: Text('Refresh'),
          icon: Icon(LineAwesomeIcons.sync_alt_solid),
        ),
      ])
    ];

    return responsiveValue(context, md: mdList, sm: smList, xs: smList);
  }

  List<Widget> _buildTaskList(BuildContext context) {
    return [
      ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: FUIInputCheckbox(
                initialValue: false,
                onChanged: (_) {},
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 10,
            child: FUIColumn(
              children: [
                PreH(Text('Sprint (Alpha)')),
                FUISpacer.vSpace5,
                Regular(Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
                FUISpacer.vSpace10,
                Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  children: [
                    FUITextPill(fuiColorScheme: FUIColorScheme.primary, text: Text('Team A')),
                    FUITextPill(fuiColorScheme: FUIColorScheme.secondary, text: Text('Sydney Office')),
                  ],
                ),
                FUISpacer.vSpace20,
              ],
            ),
          ),
        ],
      ),
      ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: FUIInputCheckbox(
                initialValue: false,
                onChanged: (_) {},
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 8,
            child: FUIColumn(
              children: [
                PreH(Text('Sprint (Beta)')),
                FUISpacer.vSpace5,
                Regular(Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
                FUISpacer.vSpace10,
                Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  children: [
                    FUITooltip(
                      tooltip: Text('Jeremy Mays'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.papayaWhip,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-02.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Mckinley Davis'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.error,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-05.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Juliana Evans'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.papayaWhip,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-11.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Dana Curtis'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.ruby,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-13.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Mannas Khan'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.banana,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-11.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Tanner Bray'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.primary,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-06.jpg'),
                      ),
                    ),
                  ],
                ),
                FUISpacer.vSpace20,
              ],
            ),
          ),
        ],
      ),
      ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: FUIInputCheckbox(
                initialValue: false,
                onChanged: (_) {},
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PreH(Text('Spring (Delta)')),
                FUISpacer.vSpace5,
                Regular(Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
                FUISpacer.vSpace10,
                Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  children: [
                    FUITextPill(fuiColorScheme: FUIColorScheme.prussian, text: Text('Team B')),
                    FUITextPill(fuiColorScheme: FUIColorScheme.lightGrey, text: Text('Team C')),
                    FUITextPill(fuiColorScheme: FUIColorScheme.warning, text: Text('Pending')),
                  ],
                ),
                FUISpacer.vSpace20,
              ],
            ),
          ),
        ],
      ),
      ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 2,
            child: Padding(
              padding: EdgeInsets.only(top: 8),
              child: FUIInputCheckbox(
                initialValue: false,
                onChanged: (_) {},
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PreH(Text('Sprint (Gamma)')),
                FUISpacer.vSpace5,
                Regular(Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.')),
                FUISpacer.vSpace10,
                Wrap(
                  runSpacing: 5,
                  spacing: 10,
                  children: [
                    FUITooltip(
                      tooltip: Text('Jeremy Mays'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.papayaWhip,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-02.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Mckinley Davis'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.error,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-05.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Juliana Evans'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.papayaWhip,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-11.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Dana Curtis'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.ruby,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-13.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Mannas Khan'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.banana,
                        avatar: AssetImage('assets/demo-avatar/avatar-man-11.jpg'),
                      ),
                    ),
                    FUITooltip(
                      tooltip: Text('Tanner Bray'),
                      child: FUIAvatar(
                        fuiColorScheme: FUIColorScheme.primary,
                        avatar: AssetImage('assets/demo-avatar/avatar-woman-06.jpg'),
                      ),
                    ),
                  ],
                ),
                FUISpacer.vSpace20,
              ],
            ),
          ),
        ],
      ),
    ];
  }
}
