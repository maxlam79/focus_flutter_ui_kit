import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetBusiness06 extends StatelessWidget {
  const DemoWidgetBusiness06({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('TEAM MANAGEMENT'),
      height: 700,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: true,
      content: FUIColumn(
        children: [
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-man-05.jpg'), 'Mckinley Davis', 'Project Manager'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-man-01.jpg'), 'Mike Cohen', 'Backend Developer'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-13.jpg'), 'Dana Curtis', 'UX/UI Front End Developer'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-06.jpg'), 'Tanner Bray', 'Team Lead'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-man-11.jpg'), 'Mannas Khan', 'Head of Compliance'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-03.jpg'), 'Savanna Donovan', 'Business Analyst'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-man-02.jpg'), 'Jeremy Mays', 'Business Analyst'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-06.jpg'), 'Tanner Bray', 'Technical Writer'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-man-13.jpg'), 'Gregory Flores', 'Backend Developer'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-07.jpg'), 'Abdiel Roberson', 'UX/UI Front End Developer'),
          _buildTeamMember(AssetImage('assets/demo-avatar/avatar-woman-11.jpg'), 'Juliana Evans', 'Technical Support'),
        ],
      ),
      footerShow: true,
      footerSeparator: true,
      footer: FUIButtonBlockTextIcon(
        fuiButtonBlockLevel: FUIButtonBlockLevel.full,
        text: Text('Add New'),
        onPressed: () {},
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

  _buildTeamMember(ImageProvider avatarImg, String name, String desc) {
    return Padding(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            xs: 2,
            child: Align(
              alignment: Alignment.centerLeft,
              child: FUITooltip(
                tooltip: Text(name),
                child: FUIAvatar(
                  fuiColorScheme: FUIColorScheme.primary,
                  avatar: avatarImg,
                ),
              ),
            ),
          ),
          ResponsiveGridCol(
            xs: 9,
            child: FUIColumn(
              children: [
                RegularB(Text(name), padding: EdgeInsets.zero),
                Regular(Text(desc), padding: EdgeInsets.zero),
              ],
            ),
          ),
          ResponsiveGridCol(
            xs: 1,
            child: FUIPopupMenuIconButton(
              icon: Icon(LineAwesomeIcons.ellipsis_v_solid),
              fuiPopupMenuItemList: [
                FUIPopupMenuItem(
                  label: Text('Modify'),
                  icon: Icon(LineAwesomeIcons.edit),
                ),
                FUIPopupMenuItem(
                  label: Text('Remove'),
                  icon: Icon(LineAwesomeIcons.trash_solid),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
