import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../focus_ui_kit/exports.dart';

class DemoSearchSidebar extends StatelessWidget {
  const DemoSearchSidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return FUISectionContainer(
      child: FUISingleChildScrollView(
        child: FUIColumn(
          children: [
            responsiveValue(
              context,
              md: H2(const Text('Search')),
              sm: H4(const Text('Search')),
              xs: H4(const Text('Search')),
            ),
            FUISpacer.vSpace5,
            FUIInputText(
              label: 'Look for',
              hint: 'Type something...',
              minWidth: double.infinity,
              textInputAction: TextInputAction.search,
              onFieldSubmitted: (searchStr) {
                print('Searching for: $searchStr');
              },
              sideIcon: const Icon(
                Boxicons.bx_search,
              ),
            ),
            FUISpacer.vSpace10,
            H5(const Text('Search in')),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIInputCheckbox(
                  initialValue: true,
                  onChanged: (_) {},
                ),
                FUISpacer.hSpace10,
                FieldLabel(const Text('People')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIInputCheckbox(
                  initialValue: true,
                  onChanged: (_) {},
                ),
                FUISpacer.hSpace10,
                FieldLabel(const Text('Documents')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIInputCheckbox(
                  initialValue: true,
                  onChanged: (_) {},
                ),
                FUISpacer.hSpace10,
                FieldLabel(const Text('Transactions')),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FUIInputCheckbox(
                  initialValue: true,
                  onChanged: (_) {},
                ),
                FUISpacer.hSpace10,
                FieldLabel(const Text('Inventory')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
