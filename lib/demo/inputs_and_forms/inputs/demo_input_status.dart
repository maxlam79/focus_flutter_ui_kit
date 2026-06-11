import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoInputStatus extends StatelessWidget {
  const DemoInputStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionPlain(
      horizontalSpace: FUISectionHorizontalSpace.focus,
      child: ResponsiveGridRow(
        children: [
          _buildIntro(),
          ResponsiveGridCol(
            sm: 12,
            md: 8,
            child: ResponsiveGridRow(
              children: [
                _buildReadOnlyAndEnable(),
                _buildDiffStatus(),
                _buildSideIcon(),
              ],
            ),
          )
        ],
      ),
    );
  }

  ResponsiveGridCol _buildIntro() {
    return ResponsiveGridCol(
      sm: 12,
      md: 4,
      child: FUISectionContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreH(Text('CONFIGURATION')),
            H2(Text('Status & Icons')),
            Regular(Text('Input fields can be decorated with status colors, and side icons.')),
          ],
        ),
      ),
    );
  }

  ResponsiveGridCol _buildReadOnlyAndEnable() {
    return ResponsiveGridCol(
      sm: 12,
      child: FUISectionContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H5(Text('Disable / Read Only')),
            Regular(Text('Can be either or both.')),
            FUISpacer.vSpace10,
            SmallText(Text('Dynamic setting can be achieved by firing the \'FUIInputStateChangeEvent\' event.')),
            FUISpacer.vSpace10,
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Read Only',
                      initialValue: 'These text can\'t be edited.',
                      readOnly: true,
                      minWidth: 400,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Disabled',
                      initialValue: 'These text can\'t be selected.',
                      enabled: false,
                      minWidth: 400,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ResponsiveGridCol _buildDiffStatus() {
    return ResponsiveGridCol(
      sm: 12,
      child: FUISectionContainer(
        padding: FUISectionTheme.eiSecPaddingZeroTop,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H5(Text('Status')),
            Regular(Text('Different highlight colors around the box to show the status of the input.')),
            FUISpacer.vSpace10,
            SmallTextI(Text('Setting of status is achieved via firing the \'FUIInputStateChangeEvent\'')),
            FUISpacer.vSpace10,
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Success',
                      fuiInputStatusType: FUIInputStatusType.success,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Complete / Info',
                      fuiInputStatusType: FUIInputStatusType.complete,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Warning',
                      fuiInputStatusType: FUIInputStatusType.warning,
                      fuiInputStatusText: 'Warning Hint',
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputText(
                      label: 'Error',
                      fuiInputStatusType: FUIInputStatusType.error,
                      fuiInputStatusText: 'Error Hint',
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  ResponsiveGridCol _buildSideIcon() {
    return ResponsiveGridCol(
      sm: 12,
      child: FUISectionContainer(
        padding: FUISectionTheme.eiSecPaddingZeroTop,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            H5(Text('Side Icon')),
            Regular(Text('Side icons could be included either on the right or left of the input box.')),
            FUISpacer.vSpace10,
            ResponsiveGridRow(
              children: [
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputDate(
                      label: 'Date field with side icon',
                      sideIcon: Icon(LineAwesomeIcons.calendar),
                      fuiInputSideIconPosition: FUIInputSideIconPosition.left,
                    ),
                  ),
                ),
                ResponsiveGridCol(
                  sm: 12,
                  lg: 6,
                  child: Container(
                    padding: EdgeInsets.only(right: 20),
                    child: FUIInputDate(
                      label: 'Date field with side icon',
                      sideIcon: Icon(LineAwesomeIcons.calendar),
                      fuiInputSideIconPosition: FUIInputSideIconPosition.right,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
