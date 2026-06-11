import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoWizardPage2 extends StatefulWidget {
  final DemoScreenWizardForm wizardForm;
  final FUIWizardPaneController wizPaneCtrl;

  const DemoWizardPage2({
    super.key,
    required this.wizardForm,
    required this.wizPaneCtrl,
  });

  @override
  State<DemoWizardPage2> createState() => _DemoWizardPage2State();
}

class _DemoWizardPage2State extends State<DemoWizardPage2> {
  /// Theme
  late FUIThemeCommonColors fuiColors;

  /// Bloc
  late FUIButtonController prevBtnCtrl;
  late FUIButtonController nextBtnCtrl;

  @override
  void initState() {
    super.initState();

    _initBloc();
  }

  _initBloc() {
    prevBtnCtrl = FUIButtonController();
    nextBtnCtrl = FUIButtonController();
  }

  @override
  void dispose() {
    prevBtnCtrl.close();
    nextBtnCtrl.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;

    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          xl: 4,
          lg: 12,
          child: _buildSideInfo(),
        ),
        ResponsiveGridCol(
          xl: 8,
          lg: 12,
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: responsiveValue(context, lg: true, md: false, sm: false, xs: false),
                  child: FUIVDivider(
                    color: fuiColors.shade2,
                  ),
                ),
                Expanded(
                  child: _buildPageContent(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  _buildSideInfo() {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          const Icon(
            LineAwesomeIcons.shopping_cart_solid,
            size: 65,
          ),
          FUISpacer.vSpace10,
          H3(const Text('Purchase Items')),
          FUISpacer.vSpace5,
          Regular(const Text('Do kindly review the items to be purchased.'))
        ],
      ),
    );
  }

  _buildPageContent() {
    EdgeInsets eiSidePadding = const EdgeInsets.only(right: 20);

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H3(
            padding: eiSidePadding,
            const Text('Items Confirm'),
          ),
          FUISpacer.vSpace10,
          Regular(const Text('Here is the list of items which you are about to purchase. Please review.')),
          FUISpacer.vSpace25,
          const CartItemsWidget(),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 6,
                md: 0,
                child: const SizedBox.shrink(),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 3,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIButtonBlockTextIcon(
                    fuiButtonController: prevBtnCtrl,
                    text: const Text('Previous'),
                    onPressed: () => widget.wizPaneCtrl.prevPage(),
                  ),
                ),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 3,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIButtonBlockTextIcon(
                    fuiButtonController: nextBtnCtrl,
                    text: const Text('Next'),
                    onPressed: () => widget.wizPaneCtrl.nextPage(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CartItemsWidget extends StatelessWidget {
  const CartItemsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return _buildContentMd();
  }

  _buildContentMd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Items',
                    style: headerStyle,
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Qty',
                    style: headerStyle,
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Price',
                    style: headerStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        FUIHDivider(),
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('HEAVY DUTY DRILL', style: itemNameStyle),
                      Text('Part No. DD2839', style: itemPartNoStyle),
                      Text('Type: H / Hammer Type', style: itemDescStyle),
                      FUISpacer.vSpace5,
                      Text('Uni Price: \$150.90 (incl. sales tax)', style: itemUnitPriceStyle),
                    ],
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '5',
                    style: qtyStyle,
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\$754.50',
                    style: priceStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        FUISpacer.vSpace20,
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ANGEL GRINDER', style: itemNameStyle),
                      Text('Part No. MG3843', style: itemPartNoStyle),
                      Text('Type: C / Metal Application', style: itemDescStyle),
                      FUISpacer.vSpace5,
                      Text('Uni Price: \$23.90 (incl. sales tax)', style: itemUnitPriceStyle),
                    ],
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '2',
                    style: qtyStyle,
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\$47.80',
                    style: priceStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        FUISpacer.vSpace20,
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MOTOR WRENCH KIT 4 SPEED', style: itemNameStyle),
                      Text('Part No. MW2383', style: itemPartNoStyle),
                      Text('Type: DI / Drive Impact', style: itemDescStyle),
                      FUISpacer.vSpace5,
                      Text('Uni Price: \$50.70 (incl. sales tax)', style: itemUnitPriceStyle),
                    ],
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '3',
                    style: qtyStyle,
                  ),
                ],
              ),
            ),
            ResponsiveGridCol(
              md: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '\$152.10',
                    style: priceStyle,
                  ),
                ],
              ),
            ),
          ],
        ),
        FUISpacer.vSpace20,
        FUIHDivider(),
        FUISpacer.vSpace10,
        ResponsiveGridRow(
          children: [
            ResponsiveGridCol(
              md: 8,
              child: const SizedBox.shrink(),
            ),
            ResponsiveGridCol(
              md: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Total : ', style: totalPriceStyle),
                  FUISpacer.hSpace10,
                  Text('\$954.40', style: totalPriceStyle),
                ],
              ),
            ),
          ],
        ),
        FUISpacer.vSpace10,
        FUIHDivider(),
      ],
    );
  }

  TextStyle get headerStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w600);
  }

  TextStyle get itemNameStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w800);
  }

  TextStyle get itemPartNoStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w400);
  }

  TextStyle get itemDescStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeSmallText, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w300);
  }

  TextStyle get itemUnitPriceStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w600);
  }

  TextStyle get qtyStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w500);
  }

  TextStyle get priceStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeRegular, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w600);
  }

  TextStyle get totalPriceStyle {
    return const TextStyle(fontSize: FUITypographyTheme.fontSizeH5, fontFamily: FUITypographyTheme.fontFamilyPrimary, fontWeight: FontWeight.w800);
  }
}
