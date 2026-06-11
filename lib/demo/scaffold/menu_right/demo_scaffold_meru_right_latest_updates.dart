import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetScaffoldMenuRightLatestUpdates extends StatelessWidget {
  const DemoWidgetScaffoldMenuRightLatestUpdates({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUIPanelTheme panelTheme = context.theme.fuiPanel;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    commentBox(List<FUITextPill> textPillList, ImageProvider avatarImgProvider, String name, String timestamp, String comments) {
      return Padding(
        padding: EdgeInsets.only(top: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FractionallySizedBox(
              widthFactor: 1,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 10,
                children: textPillList,
              ),
            ),
            FUISpacer.vSpace10,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIAvatar(
                  avatar: avatarImgProvider,
                  fuiAvatarSize: FUIAvatarSize.small,
                ),
                FUISpacer.hSpace15,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: typoTheme.h3.copyWith(fontSize: 15)),
                    Text(timestamp, style: typoTheme.smallText.copyWith(fontSize: 10)),
                  ],
                ),
              ],
            ),
            FUISpacer.vSpace10,
            SmallText(Text(comments)),
            FractionallySizedBox(
              widthFactor: 1,
              child: Wrap(
                alignment: WrapAlignment.end,
                spacing: 2,
                children: [
                  FUITooltip(tooltip: Text('Tag'), child: FUIButtonLinkIcon(icon: Icon(Boxicons.bx_tag, color: fuiColors.shade3, size: 14), onPressed: () {})),
                  FUITooltip(
                      tooltip: Text('View'), child: FUIButtonLinkIcon(icon: Icon(Boxicons.bx_comment, color: fuiColors.shade3, size: 14), onPressed: () {})),
                  FUITooltip(
                      tooltip: Text('Reply'), child: FUIButtonLinkIcon(icon: Icon(Boxicons.bx_reply, color: fuiColors.shade3, size: 14), onPressed: () {})),
                ],
              ),
            )
          ],
        ),
      );
    }

    return FUIPanel(
      panelBackgroundColor: fuiColors.shade0,
      header: Text('Latest Updates'),
      headerSeparator: false,
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
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commentBox(
            [
              FUITextPill(text: Text('Issue #1029')),
              FUITextPill(fuiColorScheme: FUIColorScheme.secondary, text: Text('Project Nebula')),
            ],
            AssetImage('assets/demo-avatar/avatar-man-01.jpg'),
            'Scott S. Quintero',
            '34 minutes ago',
            'Quisque eleifend efficitur dolor, malesuada mattis tortor blandit id. Phasellus facilisis hendrerit arcu sit amet porta.',
          ),
          FUIHDivider(),
          commentBox(
            [
              FUITextPill(fuiColorScheme: FUIColorScheme.denim, text: Text('Progress Meeting')),
              FUITextPill(fuiColorScheme: FUIColorScheme.lightGrey, text: Text('Team Delta')),
            ],
            AssetImage('assets/demo-avatar/avatar-woman-02.jpg'),
            'Lee R. Lundberg',
            '6 hours ago',
            'Quisque eleifend efficitur dolor, malesuada mattis tortor blandit id. Phasellus facilisis hendrerit arcu sit amet porta.',
          ),
          FUIHDivider(),
          commentBox(
            [
              FUITextPill(fuiColorScheme: FUIColorScheme.bumbleBee, text: Text('HR')),
              FUITextPill(fuiColorScheme: FUIColorScheme.denim, text: Text('Interview')),
            ],
            AssetImage('assets/demo-avatar/avatar-man-03.jpg'),
            'Chris S. Stuart',
            'Yesterday',
            'Quisque eleifend efficitur dolor, malesuada mattis tortor blandit id. Phasellus facilisis hendrerit arcu sit amet porta.',
          ),
        ],
      ),
    );
  }
}
