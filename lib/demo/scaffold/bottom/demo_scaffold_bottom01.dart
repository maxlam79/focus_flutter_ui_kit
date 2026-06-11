import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoScaffoldBottom01 extends StatelessWidget {
  const DemoScaffoldBottom01({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionPlain(
      horizontalSpace: FUISectionHorizontalSpace.focus,
      backgroundColor: fuiColors.secondary,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                xl: 3,
                child: _buildLinkCol1(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                xl: 3,
                child: _buildLinkCol2(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                xl: 3,
                child: _buildLinkCol3(context),
              ),
              ResponsiveGridCol(
                sm: 12,
                md: 6,
                xl: 3,
                child: _buildLinkCol4(context),
              ),
            ],
          ),
          FUISpacer.vSpace20,
          _buildFooter(context),
        ],
      ),
    );
  }

  _buildLinkCol1(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    TextStyle tsDot = typoTheme.h1.copyWith(color: fuiColors.primary);
    TextStyle tsTitle = typoTheme.h1.copyWith(color: fuiColors.shade0);

    return FUISectionContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          FUISpacer.vSpace10,
          Regular(Text(
            'More than just a theme, a Flutter UI toolkit crafted to lift burdens from extensive development of UI for the web / mobile / desktop.',
            style: TextStyle(color: fuiColors.shade2),
          )),
          FUISpacer.vSpace30,
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
          ),
        ],
      ),
    );
  }

  _buildLinkCol2(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H3(Text('Elements', style: TextStyle(color: fuiColors.shade2))),
          FUISpacer.vSpace20,
          FUIButtonLinkTextIcon(
            text: Text('Typography', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsTypography);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Color', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsColors);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Buttons', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsButtons);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Panes & Panels', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsPanePanel);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Tabs & Accordions', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsTabAndAccordion);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Notifications & Modals', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathElementsNotificationsAndModals);
            },
          ),
        ],
      ),
    );
  }

  _buildLinkCol3(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H3(Text('Forms', style: TextStyle(color: fuiColors.shade2))),
          FUISpacer.vSpace20,
          FUIButtonLinkTextIcon(
            text: Text('Input Fields', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathInputsAndFormsInput);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Forms & Wizards', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathInputsAndFormsFormsAndWizards);
            },
          ),
          FUISpacer.vSpace30,
          H3(Text('Pages', style: TextStyle(color: fuiColors.shade2))),
          FUISpacer.vSpace20,
          FUIButtonLinkTextIcon(
            text: Text('Login / Authentication', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathPagesLogin01);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Error 404', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathPagesErrorNotFound);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Error 500', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathPagesErrorService);
            },
          ),
        ],
      ),
    );
  }

  _buildLinkCol4(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return FUISectionContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          H3(Text('Other Components', style: TextStyle(color: fuiColors.shade2))),
          FUISpacer.vSpace20,
          FUIButtonLinkTextIcon(
            text: Text('Data Tables', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathOthersDataTable);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Graphs & Charts', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathOthersVisualInfo);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Calendar', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathOthersCalendar);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Time Line', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathOthersTimeline);
            },
          ),
          FUISpacer.vSpace10,
          FUIButtonLinkTextIcon(
            text: Text('Widgets Catalog', style: TextStyle(color: fuiColors.shade2)),
            onPressed: () {
              _goto(context, DemoPaths.pathWidgetCatalog);
            },
          ),
        ],
      ),
    );
  }

  _buildFooter(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return FUISectionContainer(
      child: ResponsiveGridRow(
        children: [
          ResponsiveGridCol(
            md: 6,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text('Copyright \u00A9 2024 - ${DateTime.now().year}. Max Lam and contributors.', style: typoTheme.regular.copyWith(color: fuiColors.shade2)),
            ),
          ),
          ResponsiveGridCol(
            md: 6,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FUIButtonLinkTextIcon(
                      text: Text(
                        'GitHub',
                        style: TextStyle(color: fuiColors.shade2),
                      ),
                      onPressed: () {
                        launchUrl(
                          Uri.parse('https://github.com/maxlam79/focus_flutter_ui_kit'),
                          webOnlyWindowName: '_blank', // launch to new tab
                        );
                      }),
                  FUISpacer.hSpace25,
                  FUIButtonLinkTextIcon(
                      text: Text(
                        'Docs',
                        style: TextStyle(color: fuiColors.shade2),
                      ),
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
                        style: TextStyle(color: fuiColors.shade2),
                      ),
                      onPressed: () {
                        launchUrl(
                          Uri.parse('https://github.com/maxlam79/focus_flutter_ui_kit_starter'),
                          webOnlyWindowName: '_blank', // launch to new tab
                        );
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _goto(BuildContext context, String path) {
    context.go(path);
  }
}
