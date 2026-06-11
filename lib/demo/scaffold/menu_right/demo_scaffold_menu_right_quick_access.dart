import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoScaffoldMenuRightQuickAccess extends StatelessWidget with FUIColorMixin {
  DemoScaffoldMenuRightQuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUIPanelTheme panelTheme = context.theme.fuiPanel;

    return FUIPanel(
      panelBackgroundColor: fuiColors.shade0,
      height: 330,
      header: Text('QUICK ACCESS'),
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
      panelBorderColor: Colors.transparent,
      contentScrollBarEnable: false,
      content: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuickAccessBox(context, FUIColorScheme.primary, Icon(Boxicons.bxs_dashboard),
                  Text('Dashboard'), () {}),
              _buildQuickAccessBox(context, FUIColorScheme.secondary, Icon(Boxicons.bxl_graphql),
                  Text('CRM'), () {}),
            ],
          ),
          FUISpacer.vSpace10,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildQuickAccessBox(context, FUIColorScheme.opal, Icon(Boxicons.bx_transfer_alt),
                  Text('Transactions'), () {}),
              _buildQuickAccessBox(context, FUIColorScheme.lightGrey, Icon(Boxicons.bx_cog),
                  Text('Settings'), () {}),
            ],
          ),
        ],
      ),
    );
  }

  _buildQuickAccessBox(
    BuildContext context,
    FUIColorScheme fuiColorScheme,
    Icon icon,
    Text label,
    GestureTapCallback onTap,
  ) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    Color backgroundColor = discernColorByScheme(context, fuiColorScheme: fuiColorScheme);
    Color foregroundColor = discernForegroundColorByScheme(context, fuiColorScheme: fuiColorScheme);

    double width = 120, height = 120;
    double iconSize = 60;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconTheme.merge(
                data: IconThemeData(size: iconSize, color: foregroundColor),
                child: icon,
              ),
              FUISpacer.vSpace5,
              DefaultTextStyle(
                style:
                    typoTheme.regular.copyWith(fontWeight: FontWeight.bold, color: foregroundColor),
                child: label,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
