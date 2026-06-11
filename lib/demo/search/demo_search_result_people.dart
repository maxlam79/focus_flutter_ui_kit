import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../focus_ui_kit/exports.dart';
import '../exports.dart';

class DemoSearchResultPeople extends StatefulWidget {
  const DemoSearchResultPeople({super.key});

  @override
  State<DemoSearchResultPeople> createState() => _DemoSearchResultPeopleState();
}

class _DemoSearchResultPeopleState extends State<DemoSearchResultPeople> {
  /// Theme
  late FUIPanelTheme panelTheme;

  @override
  Widget build(BuildContext context) {
    panelTheme = context.theme.fuiPanel;

    return FUIColumn(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            responsiveValue(context, md: H2(Text('People')), sm: H4(Text('People')), xs: H4(Text('People'))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIButtonBlockCircleIcon(
                  fuiButtonSize: responsiveValue(context, md: FUIButtonSize.medium, sm: FUIButtonSize.small, xs: FUIButtonSize.small),
                  fuiColorScheme: FUIColorScheme.lightGrey,
                  icon: Icon(Boxicons.bx_list_ul),
                  onPressed: () {},
                ),
                FUISpacer.hSpace5,
                FUIButtonBlockCircleIcon(
                  fuiButtonSize: responsiveValue(context, md: FUIButtonSize.medium, sm: FUIButtonSize.small, xs: FUIButtonSize.small),
                  fuiColorScheme: FUIColorScheme.lightGrey,
                  icon: Icon(Boxicons.bx_grid_small),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
        FUISpacer.vSpace20,
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              sm: 12,
              md: 6,
              lg: 4,
              child: _buildPeopleResultItem(
                AssetImage('assets/demo-avatar/avatar-man-05.jpg'),
                'Mckinley Davis',
                'Project Manager',
                '06/08/2000',
                ['Alpha', 'Beta'],
              ),
            ),
            ResponsiveGridCol(
              sm: 12,
              md: 6,
              lg: 4,
              child: _buildPeopleResultItem(
                AssetImage('assets/demo-avatar/avatar-man-01.jpg'),
                'Mike Cohen',
                'Backend Developer',
                '21/05/2004',
                ['Beta', 'Gamma'],
              ),
            ),
            ResponsiveGridCol(
              sm: 12,
              md: 6,
              lg: 4,
              child: _buildPeopleResultItem(
                AssetImage('assets/demo-avatar/avatar-woman-13.jpg'),
                'Dana Curtis',
                'UX/UI Front End Developer',
                '03/07/2020',
                ['Delta', 'Alpha'],
              ),
            ),
            ResponsiveGridCol(
              sm: 12,
              md: 6,
              lg: 4,
              child: _buildPeopleResultItem(
                AssetImage('assets/demo-avatar/avatar-woman-06.jpg'),
                'Tanner Bray',
                'Team Lead',
                '26/01/2021',
                ['Beta', 'Gamma'],
              ),
            ),
            ResponsiveGridCol(
              sm: 12,
              md: 6,
              lg: 4,
              child: _buildPeopleResultItem(
                AssetImage('assets/demo-avatar/avatar-man-11.jpg'),
                'Mannas Khan',
                'Head of Compliance',
                '02/01/2021',
                ['Beta', 'Delta'],
              ),
            ),
          ],
        ),
      ],
    );
  }

  _buildPeopleResultItem(ImageProvider avatarImg, String name, String role, String joinSince, List<String> projects) {
    List<Widget> prjList = [];

    for (String prj in projects) {
      prjList.add(FUITextPill(
        fuiColorScheme: DemoHelper.randomFUIColorScheme(),
        pillShape: FUITextPillShape.rounded,
        text: Text(prj),
      ));
    }

    return Padding(
      padding: responsiveValue(
        context,
        md: EdgeInsets.only(right: 10, bottom: 10),
        sm: EdgeInsets.only(bottom: 10),
        xs: EdgeInsets.only(bottom: 10),
      ),
      child: FUIPanel(
        height: 280,
        headerShow: true,
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
        contentScrollBarEnable: true,
        footerShow: false,
        content: FUIColumn(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIAvatar(
                  avatar: avatarImg,
                  fuiAvatarSize: FUIAvatarSize.large,
                ),
                FUISpacer.hSpace20,
                FUIColumn(
                  children: [
                    RegularB(Text(name)),
                    SmallText(Text(role)),
                  ],
                )
              ],
            ),
            FUISpacer.vSpace10,
            SmallText(Text('Joined since $joinSince')),
            FUISpacer.vSpace10,
            RegularB(Text('Profile')),
            Regular(Text('Ut malesuada arcu metus, tempor tempor justo tristique vel.')),
            FUISpacer.vSpace10,
            RegularB(Text('Projects')),
            FUISpacer.vSpace5,
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10,
                children: prjList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
