import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';

class DemoWidgetBusiness04 extends StatelessWidget {
  const DemoWidgetBusiness04({super.key});

  @override
  Widget build(BuildContext context) {
    return FUIPanel(
      headerShow: true,
      header: Text('TRANSACTION HISTORY'),
      height: 700,
      headerIconButtons: _buildHeaderIconButtons(context),
      contentScrollBarEnable: false,
      content: FUIColumn(
        children: [
          _buildTop(context),
          FUISpacer.vSpace20,
          H5(Text('Outstanding Invoices')),
          _buildUnpaidDataTable(context),
          FUISpacer.vSpace10,
          H5(Text('Last Transactions')),
          _buildPaidDataTable(context),
        ],
      ),
      footerShow: true,
      footerSeparator: true,
      footer: FUIButtonBlockTextIcon(
        fuiButtonBlockLevel: FUIButtonBlockLevel.full,
        text: Text('View Details'),
        onPressed: () {},
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

  _buildTop(BuildContext context) {
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    return ResponsiveGridRow(
      children: [
        ResponsiveGridCol(
          xs: 6,
          child: FUIColumn(
            children: [
              Text('Company Ltd.', style: typoTheme.defaultTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.w700)),
              Text('Last updated 11/06/24', style: typoTheme.defaultTextStyle.copyWith(fontSize: 9, fontWeight: FontWeight.w300)),
            ],
          ),
        ),
        ResponsiveGridCol(
          xs: 6,
          child: Align(
            alignment: Alignment.topRight,
            child: Text('723,483', style: typoTheme.defaultTextStyle.copyWith(fontSize: 26, fontWeight: FontWeight.w700)),
          ),
        ),
      ],
    );
  }

  _buildUnpaidDataTable(BuildContext context) {
    FUIDataTableColumnHelper dtColumnHelper = FUIDataTableColumnHelper(context);
    FUIDataTableCellHelper dtCellHelper = FUIDataTableCellHelper(context);

    return SizedBox(
      height: 200, // Always have height bounded when using FUIAsyncPaginatedDataTable2
      child: FUIDataTable2(
        fuiDataTable2Size: FUIDataTable2Size.small,
        columns: [
          DataColumn2(label: dtColumnHelper.genLabel(text: 'Items')),
          DataColumn2(
            label: dtColumnHelper.genLabel(text: 'Amount (USD)', alignment: FUIDataTable2Alignment.right),
            fixedWidth: 120,
          ),
          DataColumn2(
            label: dtColumnHelper.genLabel(text: ''),
            fixedWidth: 80,
          ),
        ],
        rows: [
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2930293')),
              DataCell(dtCellHelper.genData(text: '1,293,304', bold: true, alignment: FUIDataTable2Alignment.right)),
              DataCell(
                Center(
                  child: Wrap(
                    runSpacing: 1,
                    spacing: 1,
                    children: [
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.search_solid,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.edit,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2837483')),
              DataCell(dtCellHelper.genData(text: '789.302', bold: true, alignment: FUIDataTable2Alignment.right)),
              DataCell(
                Center(
                  child: Wrap(
                    runSpacing: 1,
                    spacing: 1,
                    children: [
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.search_solid,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.edit,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2738293')),
              DataCell(dtCellHelper.genData(text: '576,203', bold: true, alignment: FUIDataTable2Alignment.right)),
              DataCell(
                Center(
                  child: Wrap(
                    runSpacing: 1,
                    spacing: 1,
                    children: [
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.search_solid,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.edit,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV192839')),
              DataCell(dtCellHelper.genData(text: '934,382', bold: true, alignment: FUIDataTable2Alignment.right)),
              DataCell(
                Center(
                  child: Wrap(
                    runSpacing: 1,
                    spacing: 1,
                    children: [
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.search_solid,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.edit,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV182938')),
              DataCell(dtCellHelper.genData(text: '2,392,493', bold: true, alignment: FUIDataTable2Alignment.right)),
              DataCell(
                Center(
                  child: Wrap(
                    runSpacing: 1,
                    spacing: 1,
                    children: [
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.search_solid,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                      FUIButtonLinkIcon(
                        icon: Icon(
                          LineAwesomeIcons.edit,
                          size: 12,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildPaidDataTable(BuildContext context) {
    FUIDataTableColumnHelper dtColumnHelper = FUIDataTableColumnHelper(context);
    FUIDataTableCellHelper dtCellHelper = FUIDataTableCellHelper(context);

    return SizedBox(
      height: 200, // Always have height bounded when using FUIAsyncPaginatedDataTable2
      child: FUIDataTable2(
        fuiDataTable2Size: FUIDataTable2Size.small,
        columns: [
          DataColumn2(label: dtColumnHelper.genLabel(text: 'Items')),
          DataColumn2(label: dtColumnHelper.genLabel(text: 'Amount (USD)', alignment: FUIDataTable2Alignment.right)),
        ],
        rows: [
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2930293')),
              DataCell(dtCellHelper.genData(text: '1,293,304', bold: true, alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2837483')),
              DataCell(dtCellHelper.genData(text: '789.302', bold: true, alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV2738293')),
              DataCell(dtCellHelper.genData(text: '576,203', bold: true, alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV192839')),
              DataCell(dtCellHelper.genData(text: '934,382', bold: true, alignment: FUIDataTable2Alignment.right)),
            ],
          ),
          DataRow2(
            cells: [
              DataCell(dtCellHelper.genData(text: 'Invoice INV182938')),
              DataCell(dtCellHelper.genData(text: '2,392,493', bold: true, alignment: FUIDataTable2Alignment.right)),
            ],
          ),
        ],
      ),
    );
  }
}
