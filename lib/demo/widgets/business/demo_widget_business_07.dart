import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetBusiness07 extends StatelessWidget {
  const DemoWidgetBusiness07({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('SUPPLIER DIRECTORY'),
      height: 530,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: true,
      content: FUIColumn(
        children: [
          FUISpacer.vSpace20,
          _buildIconButtons(context),
          FUISpacer.vSpace20,
          _buildCompanyInfo(context),
          FUISpacer.vSpace20,
          _buildHighlightBox(context),
          FUISpacer.vSpace20,
          H5(Text('General Info')),
          _buildFieldValues(context),
        ],
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

  _buildIconButtons(BuildContext context) {
    return Wrap(
      spacing: 15,
      children: [
        FUITooltip(
          tooltip: Text('Company QR'),
          child: FUIButtonOutlinedCircleIcon(fuiButtonSize: FUIButtonSize.large, icon: Icon(Boxicons.bx_qr), onPressed: () {}),
        ),
        FUITooltip(
          tooltip: Text('Company Website'),
          child: FUIButtonOutlinedCircleIcon(fuiButtonSize: FUIButtonSize.large, icon: Icon(Boxicons.bx_link_external), onPressed: () {}),
        ),
        FUITooltip(
          tooltip: Text('Call Directly'),
          child: FUIButtonOutlinedCircleIcon(fuiButtonSize: FUIButtonSize.large, icon: Icon(Boxicons.bx_phone), onPressed: () {}),
        ),
        FUITooltip(
          tooltip: Text('Update'),
          child: FUIButtonOutlinedCircleIcon(fuiButtonSize: FUIButtonSize.large, icon: Icon(Boxicons.bx_edit), onPressed: () {}),
        ),
      ],
    );
  }

  _buildCompanyInfo(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 15,
      children: [
        Text('Orange Limited', style: typoTheme.h2),
        Padding(
          padding: EdgeInsets.only(top: 5),
          child: FUITextPill(text: Text('Active')),
        ),
      ],
    );
  }

  _buildHighlightBox(BuildContext context) {
    return FUISectionHighlightBox(
      child: FUIColumn(
        children: [
          Text('Remarks', style: TextStyle(fontWeight: FontWeight.bold)),
          FUISpacer.vSpace5,
          Text(
              'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga.'),
        ],
      ),
    );
  }

  _buildFieldValues(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    TextStyle labelTs = typoTheme.regular.copyWith(color: fuiColors.textHinted);
    TextStyle valueTs = typoTheme.regular.copyWith(fontWeight: FontWeight.bold);

    Widget buildLabelAndValue(String label, String value) {
      return Padding(
        padding: EdgeInsets.only(top: 5, bottom: 5),
        child: ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              xs: 3,
              child: DefaultTextStyle(style: labelTs, child: Text(label)),
            ),
            ResponsiveGridCol(
              xs: 9,
              child: DefaultTextStyle(style: valueTs, child: Text(value)),
            ),
          ],
        ),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelAndValue('Company Reg. No.', 'GH2039-SD-23'),
        buildLabelAndValue('Corresponding Address', '''176 WOODLANDS INDUSTRIAL PARK E5
#03-02
SINGAPORE (70000)'''),
        buildLabelAndValue('Paidup Capital', '\$39,203,203'),
      ],
    );
  }
}
