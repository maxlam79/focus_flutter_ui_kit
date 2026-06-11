import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoWizardPage4 extends StatefulWidget {
  final DemoScreenWizardForm wizardForm;
  final FUIWizardPaneController wizPaneCtrl;
  final FormFieldsRefreshController refreshCtrl;

  const DemoWizardPage4({
    super.key,
    required this.wizardForm,
    required this.wizPaneCtrl,
    required this.refreshCtrl,
  });

  @override
  State<DemoWizardPage4> createState() => _DemoWizardPage4State();
}

class _DemoWizardPage4State extends State<DemoWizardPage4> {
  /// Theme
  late FUIThemeCommonColors fuiColors;

  /// Bloc
  late FUIInputFieldController ccNoFieldCtrl;
  late FUIInputFieldController ccNameFieldCtrl;
  late FUIInputFieldSelectController ccExpMonthFieldCtrl;
  late FUIInputFieldSelectController ccExpYearFieldCtrl;
  late FUIInputFieldController ccCVVFieldCtrl;
  late FUIButtonController prevBtnCtrl;
  late FUIButtonController confirmBtnCtrl;

  late Logger log;

  @override
  void initState() {
    super.initState();

    log = Logger();

    ccNoFieldCtrl = FUIInputFieldController();
    ccNameFieldCtrl = FUIInputFieldController();
    ccExpMonthFieldCtrl = FUIInputFieldSelectController();
    ccExpYearFieldCtrl = FUIInputFieldSelectController();
    ccCVVFieldCtrl = FUIInputFieldController();

    prevBtnCtrl = FUIButtonController();
    confirmBtnCtrl = FUIButtonController(fuiButtonEvent: FUIButtonEvent(enable: false));
  }

  @override
  void dispose() {
    ccNoFieldCtrl.close();
    ccNameFieldCtrl.close();
    ccExpMonthFieldCtrl.close();
    ccExpYearFieldCtrl.close();
    ccCVVFieldCtrl.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;

    return BlocProvider(
      create: (_) => widget.refreshCtrl,
      child: BlocBuilder(
        bloc: widget.refreshCtrl,
        builder: (BuildContext context, bool refresh) {
          if (refresh) {
            if (!widget.wizardForm.ccNoField.isPure) {
              _onChangeCCNo(widget.wizardForm.ccNoField.value);
            }

            if (!widget.wizardForm.ccNameField.isPure) {
              _onChangeCCName(widget.wizardForm.ccNameField.value);
            }

            if (!widget.wizardForm.ccExpMonthField.isPure) {
              _onChangeCCExpMonth(widget.wizardForm.ccExpMonthField.value);
            }

            if (!widget.wizardForm.ccExpYearField.isPure) {
              _onChangeCCExpYear(widget.wizardForm.ccExpYearField.value);
            }

            if (!widget.wizardForm.ccCVVField.isPure) {
              _onChangeCCCVV(widget.wizardForm.ccCVVField.value);
            }
          }

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
                        visible:
                            responsiveValue(context, lg: true, md: false, sm: false, xs: false),
                        child: FUIVDivider(
                          color: fuiColors.shade2,
                        ),
                      ),
                      Expanded(
                        child: _buildForm(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _buildSideInfo() {
    return FUISectionContainer(
      child: FUIColumn(
        children: [
          Icon(
            LineAwesomeIcons.credit_card,
            size: 65,
          ),
          FUISpacer.vSpace10,
          H3(Text('Payment Info')),
          FUISpacer.vSpace5,
          Regular(Text('Please fill in the credit card details for payment.')),
          FUISpacer.vSpace15,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FUISpacer.hSpace15,
              Icon(FontAwesomeIcons.ccVisa.data, size: 25),
              Icon(FontAwesomeIcons.ccMastercard.data, size: 25),
              Icon(FontAwesomeIcons.ccAmex.data, size: 25),
              Icon(FontAwesomeIcons.ccDiscover.data, size: 25),
              FUISpacer.hSpace15,
            ],
          ),
        ],
      ),
    );
  }

  _buildForm() {
    EdgeInsets eiSidePadding = EdgeInsets.only(right: 20);

    var ccNoMaskFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    var ccCVVMaskFormatter = MaskTextInputFormatter(
      mask: '###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy,
    );

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H3(
            padding: eiSidePadding,
            Text('Payment Details'),
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: ccNoFieldCtrl,
                    initialValue: widget.wizardForm.ccNoField.value,
                    label: 'Credit Card No.',
                    minWidth: double.infinity,
                    mandatory: true,
                    inputFormatters: [ccNoMaskFormatter],
                    onChanged: (value) => _onChangeCCNo(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: ccNameFieldCtrl,
                    initialValue: widget.wizardForm.ccNameField.value,
                    label: 'Name on Card',
                    minWidth: double.infinity,
                    mandatory: true,
                    onChanged: (value) => _onChangeCCName(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 4,
                md: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: _buildCCExpMonthSelect(),
                ),
              ),
              ResponsiveGridCol(
                lg: 4,
                md: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: _buildCCExpYearSelect(),
                ),
              ),
              ResponsiveGridCol(
                lg: 4,
                md: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: ccCVVFieldCtrl,
                    initialValue: widget.wizardForm.ccCVVField.value,
                    label: 'CVV',
                    hint: 'The 3 digit CVV security code.',
                    mandatory: true,
                    inputFormatters: [ccCVVMaskFormatter],
                    onChanged: (value) => _onChangeCCCVV(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 6,
                md: 0,
                child: SizedBox.shrink(),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 3,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIButtonBlockTextIcon(
                    fuiButtonController: prevBtnCtrl,
                    text: Text('Previous'),
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
                    fuiButtonController: confirmBtnCtrl,
                    text: Text('Confirm'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildCCExpMonthSelect() {
    NumberFormat nf = NumberFormat("00");
    List<SingleItemCategoryModel> itemList = [];
    List<SingleItemCategoryModel> selectedItemList = [];

    for (int i = 1; i <= 12; i++) {
      var v = nf.format(i);
      var item = SingleItemCategoryModel(value: v, nameSingleItem: v);
      itemList.add(item);

      if (!widget.wizardForm.ccExpMonthField.isPure &&
          selectedItemList.isEmpty &&
          item.value == widget.wizardForm.ccExpMonthField.value) {
        selectedItemList.add(item);
      }
    }

    List<SingleCategoryModel> modelList = [
      SingleCategoryModel(
        singleItemCategoryList: itemList,
      ),
    ];

    return FUIInputSelect(
      fuiInputSize: FUIInputSize.small,
      fuiInputFieldSelectController: ccExpMonthFieldCtrl,
      label: 'Exp Month',
      hint: 'Select one',
      dataList: modelList,
      selectedDataList: selectedItemList,
      onChanged: (expMonth) => _onChangeCCExpMonth(expMonth),
    );
  }

  _buildCCExpYearSelect() {
    List<SingleItemCategoryModel> itemList = [];
    List<SingleItemCategoryModel> selectedItemList = [];
    int minYear = DateTime.now().year;
    int maxYear = minYear + 20;

    for (int i = minYear; i <= maxYear; i++) {
      var item = SingleItemCategoryModel(value: '$i', nameSingleItem: '$i');
      itemList.add(item);

      if (!widget.wizardForm.ccExpYearField.isPure &&
          selectedItemList.isEmpty &&
          item.value == widget.wizardForm.ccExpYearField.value) {
        selectedItemList.add(item);
      }
    }

    var modelList = [
      SingleCategoryModel(
        singleItemCategoryList: itemList,
      ),
    ];

    return FUIInputSelect(
      fuiInputSize: FUIInputSize.small,
      fuiInputFieldSelectController: ccExpYearFieldCtrl,
      label: 'Exp Year',
      hint: 'Select one',
      dataList: modelList,
      selectedDataList: selectedItemList,
      onChanged: (expYear) => _onChangeCCExpYear(expYear),
    );
  }

  _onChangeCCNo(value) {
    widget.wizardForm.ccNoField = CCNoField.dirty(value: value);
    CCNoFieldError? err = widget.wizardForm.ccNoField.validator(value);

    switch (err) {
      case CCNoFieldError.empty:
        ccNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case CCNoFieldError.invalid:
        ccNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please key in a valid credit card no.',
        ));
        break;
      default:
        ccNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCCName(value) {
    widget.wizardForm.ccNameField = CCNameField.dirty(value: value);
    CCNameFieldError? err = widget.wizardForm.ccNameField.validator(value);

    switch (err) {
      case CCNameFieldError.empty:
        ccNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case CCNameFieldError.tooLong:
        ccNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit the name to 250 characters.',
        ));
        break;
      default:
        ccNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCCExpMonth(value) {
    NumberFormat nf = NumberFormat("##");
    DateTime now = DateTime.now();
    int currMthYear = int.parse('${now.year}${nf.format(now.month)}');

    widget.wizardForm.ccExpMonthField = CCExpMonthField.dirty(value: value);
    CCExpMonthFieldError? err = widget.wizardForm.ccExpMonthField.validator(value);

    if (!widget.wizardForm.ccExpYearField.isPure) {
      int selectedMthYear = int.parse(
          '${widget.wizardForm.ccExpYearField.value}${widget.wizardForm.ccExpMonthField.value}');

      if (selectedMthYear <= currMthYear) {
        err = CCExpMonthFieldError.invalid;
      }
    }

    switch (err) {
      case CCExpMonthFieldError.empty:
        ccExpMonthFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty.',
        ));
        break;
      case CCExpMonthFieldError.invalid:
        ccExpMonthFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid expiration mth/year.',
        ));
        break;
      default:
        ccExpMonthFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCCExpYear(value) {
    NumberFormat nf = NumberFormat("##");
    DateTime now = DateTime.now();
    int currMthYear = int.parse('${now.year}${nf.format(now.month)}');

    widget.wizardForm.ccExpYearField = CCExpYearField.dirty(value: value);
    CCExpYearFieldError? err = widget.wizardForm.ccExpYearField.validator(value);

    if (!widget.wizardForm.ccExpMonthField.isPure) {
      int selectedMthYear = int.parse(
          '${widget.wizardForm.ccExpYearField.value}${widget.wizardForm.ccExpMonthField.value}');

      if (selectedMthYear <= currMthYear) {
        err = CCExpYearFieldError.invalid;
      }
    }

    switch (err) {
      case CCExpYearFieldError.empty:
        ccExpYearFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty.',
        ));
        break;
      case CCExpYearFieldError.invalid:
        ccExpYearFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid expiration mth/year.',
        ));
        break;
      default:
        ccExpYearFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCCCVV(value) {
    widget.wizardForm.ccCVVField = CCCVVField.dirty(value: value);
    CCCVVFieldError? err = widget.wizardForm.ccCVVField.validator(value);

    switch (err) {
      case CCCVVFieldError.empty:
        ccCVVFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case CCCVVFieldError.invalid:
        ccCVVFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid CVV detected.',
        ));
        break;
      default:
        ccCVVFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _areAllFieldsInPageOk() {
    bool enable = widget.wizardForm.ccNoField.isValid &&
        widget.wizardForm.ccNameField.isValid &&
        widget.wizardForm.ccExpMonthField.isValid &&
        widget.wizardForm.ccExpYearField.isValid &&
        widget.wizardForm.ccCVVField.isValid;

    confirmBtnCtrl.trigger(FUIButtonEvent(enable: enable));
  }
}
