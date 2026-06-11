import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoScaffoldBottom02 extends StatelessWidget {
  const DemoScaffoldBottom02({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionPlain(
      backgroundColor: fuiColors.secondary,
      horizontalSpace: FUISectionHorizontalSpace.focus,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 12,
                xl: 4,
                child: _buildLogoSection(context),
              ),
              ResponsiveGridCol(
                lg: 0,
                xl: 8,
                child: SizedBox.shrink(),
              ),
            ],
          ),
          FUISectionContainer(
            alignment: Alignment.bottomCenter,
            child: ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  lg: 12,
                  xl: 6,
                  child: _buildCopyrightSection(context),
                ),
                ResponsiveGridCol(
                  lg: 12,
                  xl: 6,
                  child: _buildSocialButtonsSection(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _buildLogoSection(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    TextStyle tsDot = typoTheme.h1.copyWith(color: fuiColors.primary);
    TextStyle tsTitle = typoTheme.h1.copyWith(color: fuiColors.shade0);
    TextStyle tsBottomRegular = typoTheme.regular.copyWith(color: fuiColors.shade2);

    return FUISectionContainer(
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: '.',
                style: tsDot,
              ),
              TextSpan(
                text: 'focus',
                style: tsTitle,
              ),
            ]),
          ),
          FUISpacer.vSpace15,
          Text('More than just a theme, a Flutter UI toolkit crafted to lift burdens from extensive development of UI for the web / mobile / desktop.',
              style: tsBottomRegular),
        ],
      ),
    );
  }

  _buildCopyrightSection(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    TextStyle tsBottomRegular = typoTheme.regular.copyWith(color: fuiColors.shade2);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: responsiveValue(context, sm: CrossAxisAlignment.start, xs: CrossAxisAlignment.center),
      children: [
        Text('Copyright \u00A9 2024 - ${DateTime.now().year}. Max Lam and contributors.', style: tsBottomRegular),
        FUISpacer.vSpace10,
        Row(
          mainAxisAlignment: responsiveValue(context, sm: MainAxisAlignment.start, xs: MainAxisAlignment.center),
          children: [
            FUIButtonLinkTextIcon(
                text: Text('GitHub'),
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://github.com/maxlam79/focus_flutter_ui_kit'),
                    webOnlyWindowName: '_blank', // launch to new tab
                  );
                }),
            FUISpacer.hSpace25,
            FUIButtonLinkTextIcon(
                text: Text('Docs'),
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://max-lams-opensource.gitbook.io/focus-flutter-ui-kit-docs/'),
                    webOnlyWindowName: '_blank', // launch to new tab
                  );
                }),
            FUISpacer.hSpace25,
            FUIButtonLinkTextIcon(
                text: Text(
                  'Starter Kit',
                ),
                onPressed: () {
                  launchUrl(
                    Uri.parse('https://github.com/maxlam79/focus_flutter_ui_kit_starter'),
                    webOnlyWindowName: '_blank', // launch to new tab
                  );
                }),
          ],
        ),
      ],
    );
  }

  _buildSocialButtonsSection(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: responsiveValue(context, sm: CrossAxisAlignment.end, xs: CrossAxisAlignment.center),
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.facebook,
                  color: fuiColors.shade2,
                ),
                onPressed: () {},
              ),
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.pinterest,
                  color: fuiColors.shade2,
                ),
                onPressed: () {},
              ),
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.youtube,
                  color: fuiColors.shade2,
                ),
                onPressed: () {},
              ),
              FUIButtonLinkIcon(
                icon: Icon(
                  LineAwesomeIcons.github,
                  color: fuiColors.shade2,
                ),
                onPressed: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
