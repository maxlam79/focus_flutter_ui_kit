import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetScaffoldMenuRightLogin extends StatelessWidget {
  const DemoWidgetScaffoldMenuRightLogin({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIPanelTheme panelTheme = context.theme.fuiPanel;

    return FUIPanel(
      panelBackgroundColor: fuiColors.shade0,
      header: Text('CURRENT USER'),
      headerSeparator: false,
      height: 170,
      headerIconButtons: [
        FUIButtonLinkIcon(
          icon: Icon(
            LineAwesomeIcons.ellipsis_v_solid,
            size: FUIPanelTheme.headerIconButtonSize,
            color: panelTheme.headerIconButtonColor,
          ),
          onPressed: () {},
        ),
      ],
      panelBorderColor: Colors.transparent,
      contentScrollBarEnable: false,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FUIAvatar(
                avatar: AssetImage('assets/demo-avatar/avatar-man-08.jpg'),
                fuiAvatarSize: FUIAvatarSize.large,
              ),
              FUISpacer.hSpace20,
              FUIColumn(
                children: [
                  Text('John Doe', style: typoTheme.h3.copyWith(fontSize: 15)),
                  SmallText(Text('18 hours ago'), padding: EdgeInsets.zero),
                ],
              ),
            ],
          ),
        ],
      ),
      footerShow: true,
      footerSeparator: false,
      footer: FUIButtonBlockTextIcon(
        fuiButtonBlockLevel: FUIButtonBlockLevel.full,
        fuiButtonSize: FUIButtonSize.small,
        fuiColorScheme: FUIColorScheme.secondary,
        icon: Icon(Boxicons.bx_log_out),
        text: Text('Sign Out'),
        onPressed: () {},
      ),
    );
  }
}
