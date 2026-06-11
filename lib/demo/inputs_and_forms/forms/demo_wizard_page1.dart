import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoWizardPage1 extends StatefulWidget {
  final DemoScreenWizardForm wizardForm;
  final FUIWizardPaneController wizPaneCtrl;
  final FormFieldsRefreshController refreshCtrl;

  const DemoWizardPage1({
    super.key,
    required this.wizardForm,
    required this.wizPaneCtrl,
    required this.refreshCtrl,
  });

  @override
  State<DemoWizardPage1> createState() => _DemoWizardPage1State();
}

class _DemoWizardPage1State extends State<DemoWizardPage1> {
  /// Theme
  late FUIThemeCommonColors fuiColors;

  /// Bloc
  late FUIInputFieldController firstNameFieldCtrl;
  late FUIInputFieldController lastNameFieldCtrl;
  late FUIInputFieldSelectController countryCodeFieldCtrl;
  late FUIInputFieldController contactNoFieldCtrl;
  late FUIInputFieldController emailFieldCtrl;
  late FUIButtonController nextBtnCtrl;

  @override
  void initState() {
    super.initState();

    _initBloc();
  }

  _initBloc() {
    firstNameFieldCtrl = FUIInputFieldController();
    lastNameFieldCtrl = FUIInputFieldController();
    countryCodeFieldCtrl = FUIInputFieldSelectController();
    contactNoFieldCtrl = FUIInputFieldController();
    emailFieldCtrl = FUIInputFieldController();

    nextBtnCtrl = FUIButtonController(fuiButtonEvent: FUIButtonEvent(enable: false));
  }

  @override
  void dispose() {
    firstNameFieldCtrl.close();
    lastNameFieldCtrl.close();
    countryCodeFieldCtrl.close();
    contactNoFieldCtrl.close();
    emailFieldCtrl.close();

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
            if (!widget.wizardForm.firstNameField.isPure) {
              _onChangeFirstName(widget.wizardForm.firstNameField.value);
            }

            if (!widget.wizardForm.lastNameField.isPure) {
              _onChangeLastName(widget.wizardForm.lastNameField.value);
            }

            if (!widget.wizardForm.countryCodeField.isPure) {
              _onChangeCountryCode(widget.wizardForm.countryCodeField.value);
            }

            if (!widget.wizardForm.contactNoField.isPure) {
              _onChangeContactNo(widget.wizardForm.contactNoField.value);
            }

            if (!widget.wizardForm.emailField.isPure) {
              _onChangeEmail(widget.wizardForm.emailField.value);
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
          const Icon(
            LineAwesomeIcons.user,
            size: 65,
          ),
          FUISpacer.vSpace10,
          H3(const Text('Customer Info')),
          FUISpacer.vSpace5,
          Regular(const Text(
              'Please fill in your personal details. Your information will be securely stored, adhering to our data privacy policy.'))
        ],
      ),
    );
  }

  _buildForm() {
    EdgeInsets eiSidePadding = const EdgeInsets.only(right: 20);

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H3(
            padding: eiSidePadding,
            const Text('How shall we identify you?'),
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xl: 6,
                lg: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: firstNameFieldCtrl,
                    initialValue: widget.wizardForm.firstNameField.value,
                    label: 'First Name',
                    mandatory: true,
                    maxLength: 250,
                    onChanged: (value) => _onChangeFirstName(value),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xl: 6,
                lg: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: lastNameFieldCtrl,
                    initialValue: widget.wizardForm.lastNameField.value,
                    label: 'Last Name',
                    mandatory: true,
                    maxLength: 250,
                    onChanged: (value) => _onChangeLastName(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace20,
          H4(
            padding: eiSidePadding,
            Text('Contact'),
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 4,
                child: Padding(
                  padding: EdgeInsets.only(right: 5),
                  child: _buildCountryCodeSelect(),
                ),
              ),
              ResponsiveGridCol(
                sm: 8,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: contactNoFieldCtrl,
                    initialValue: widget.wizardForm.contactNoField.value,
                    minWidth: double.infinity,
                    label: 'Contact No.',
                    mandatory: true,
                    maxLength: 10,
                    hint: 'Only digits (no \'-\' or \'#\')',
                    sideIcon: Icon(CupertinoIcons.phone),
                    onChanged: (value) => _onChangeContactNo(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace10,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                sm: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: emailFieldCtrl,
                    initialValue: widget.wizardForm.emailField.value,
                    minWidth: double.infinity,
                    label: 'Email',
                    mandatory: true,
                    maxLength: 100,
                    hint: 'The corresponding email must be active.',
                    sideIcon: Icon(CupertinoIcons.mail),
                    onChanged: (value) => _onChangeEmail(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 9,
                md: 0,
                child: SizedBox.shrink(),
              ),
              ResponsiveGridCol(
                md: 12,
                lg: 3,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIButtonBlockTextIcon(
                    fuiButtonController: nextBtnCtrl,
                    text: Text('Next'),
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

  _buildCountryCodeSelect() {
    return FutureBuilder(
      future: rootBundle.loadString('assets/demo-data/country-codes.json'),
      builder: (BuildContext context, AsyncSnapshot<String> data) {
        if (data.hasData) {
          List<dynamic> dataList = jsonDecode(data.requireData);
          List<SingleItemCategoryModel> itemList = [];
          List<SingleItemCategoryModel> selectedItemList = []; // only 1 item

          for (var data in dataList) {
            var name = data['name'];
            var dialCode = data['dial_code'];
            var countryCode = data['code'];

            SingleItemCategoryModel item =
                SingleItemCategoryModel(value: countryCode, nameSingleItem: '$name ($dialCode)');
            itemList.add(item);

            if (widget.wizardForm.countryCodeField.value == countryCode) {
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
            fuiInputFieldSelectController: countryCodeFieldCtrl,
            label: 'Country Code',
            hint: 'Select one',
            dataList: modelList,
            selectedDataList: selectedItemList,
            onChanged: (countryCode) => _onChangeCountryCode(countryCode),
          );
        }

        return SizedBox.shrink();
      },
    );
  }

  _onChangeFirstName(value) {
    widget.wizardForm.firstNameField = FirstNameField.dirty(value: value);
    NameFieldError? err = widget.wizardForm.firstNameField.validator(value);

    switch (err) {
      case NameFieldError.empty:
        firstNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case NameFieldError.tooLong:
        firstNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        firstNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeLastName(value) {
    widget.wizardForm.lastNameField = LastNameField.dirty(value: value);
    NameFieldError? err = widget.wizardForm.lastNameField.validator(value);

    switch (err) {
      case NameFieldError.empty:
        lastNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case NameFieldError.tooLong:
        lastNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        lastNameFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCountryCode(countryCode) {
    widget.wizardForm.countryCodeField = CountryCodeField.dirty(value: countryCode);
    CountryCodeFieldError? err = widget.wizardForm.countryCodeField.validator(countryCode);

    switch (err) {
      case CountryCodeFieldError.empty:
        countryCodeFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty.',
        ));
        break;
      case CountryCodeFieldError.invalid:
        countryCodeFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid dial code detected.',
        ));
        break;
      default:
        countryCodeFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.normal,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeContactNo(value) {
    widget.wizardForm.contactNoField = ContactNoField.dirty(value: value);
    ContactNoFieldError? err = widget.wizardForm.contactNoField.validator(value);

    switch (err) {
      case ContactNoFieldError.empty:
        contactNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case ContactNoFieldError.tooLong:
        contactNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 10 digits.',
        ));
        break;
      case ContactNoFieldError.notDigits:
        contactNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Only numbers please.',
        ));
        break;
      default:
        contactNoFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeEmail(value) {
    widget.wizardForm.emailField = EmailField.dirty(value: value);
    EmailFieldError? err = widget.wizardForm.emailField.validator(value);

    switch (err) {
      case EmailFieldError.empty:
        emailFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case EmailFieldError.tooLong:
        emailFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 100 characters.',
        ));
        break;
      case EmailFieldError.invalid:
        emailFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid email format detected.',
        ));
        break;
      default:
        emailFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _areAllFieldsInPageOk() {
    bool enable = widget.wizardForm.firstNameField.isValid &&
        widget.wizardForm.lastNameField.isValid &&
        widget.wizardForm.countryCodeField.isValid &&
        widget.wizardForm.contactNoField.isValid &&
        widget.wizardForm.emailField.isValid;

    nextBtnCtrl.trigger(FUIButtonEvent(enable: enable));
  }
}
