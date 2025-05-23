import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoInputOthers extends StatefulWidget {
  const DemoInputOthers({super.key});

  @override
  State<DemoInputOthers> createState() => _DemoInputOthersState();
}

class _DemoInputOthersState extends State<DemoInputOthers> {
  /// Controllers
  late FUIInputFieldRadioGroupController<String> radioGroupCtrl;

  @override
  void initState() {
    super.initState();

    radioGroupCtrl = FUIInputFieldRadioGroupController('A');
  }

  @override
  void dispose() {
    radioGroupCtrl.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H5(const Text('Toggle Switch')),
          _buildToggleSwitches(),
          FUISpacer.vSpace20,
          H5(const Text('Check Box')),
          _buildCheckBoxes(),
          FUISpacer.vSpace20,
          H5(const Text('Radio Buttons')),
          _buildRadioButtons(),
        ],
      ),
    );
  }

  _buildToggleSwitches() {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('LARGE')),
              FUISpacer.vSpace10,
              FUIInputToggleSwitch(
                initialValue: true,
                showOnOff: true,
                fuiInputSize: FUIInputSize.large,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Medium (Default)')),
              FUISpacer.vSpace10,
              FUIInputToggleSwitch(
                initialValue: true,
                showOnOff: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Small')),
              FUISpacer.vSpace10,
              FUIInputToggleSwitch(
                initialValue: true,
                showOnOff: true,
                fuiInputSize: FUIInputSize.small,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildCheckBoxes() {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('LARGE')),
              FUISpacer.vSpace10,
              FUIInputCheckbox(
                fuiInputSize: FUIInputSize.large,
                initialValue: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Medium (Default)')),
              FUISpacer.vSpace10,
              FUIInputCheckbox(
                fuiInputSize: FUIInputSize.medium,
                initialValue: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Small')),
              FUISpacer.vSpace10,
              FUIInputCheckbox(
                fuiInputSize: FUIInputSize.small,
                initialValue: true,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  _buildRadioButtons() {
    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('LARGE')),
              FUISpacer.vSpace10,
              FUIInputRadio<String>(
                value: 'A',
                fuiInputFieldRadioGroupController: radioGroupCtrl,
                fuiInputSize: FUIInputSize.large,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Medium (Default)')),
              FUISpacer.vSpace10,
              FUIInputRadio<String>(
                value: 'B',
                fuiInputFieldRadioGroupController: radioGroupCtrl,
                fuiInputSize: FUIInputSize.medium,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
        ResponsiveGridCol(
          sm: 12,
          md: 4,
          child: FUIColumn(
            children: [
              FieldLabel(const Text('Small')),
              FUISpacer.vSpace10,
              FUIInputRadio<String>(
                value: 'C',
                fuiInputFieldRadioGroupController: radioGroupCtrl,
                fuiInputSize: FUIInputSize.small,
                onChanged: (value) {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
