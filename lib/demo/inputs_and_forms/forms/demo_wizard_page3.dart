import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoWizardPage3 extends StatefulWidget {
  final DemoScreenWizardForm wizardForm;
  final FUIWizardPaneController wizPaneCtrl;
  final FormFieldsRefreshController refreshCtrl;

  const DemoWizardPage3({
    super.key,
    required this.wizardForm,
    required this.wizPaneCtrl,
    required this.refreshCtrl,
  });

  @override
  State<DemoWizardPage3> createState() => _DemoWizardPage3State();
}

class _DemoWizardPage3State extends State<DemoWizardPage3> {
  /// Theme
  late FUIThemeCommonColors fuiColors;

  /// Bloc
  late FUIInputFieldController address1FieldCtrl;
  late FUIInputFieldController address2FieldCtrl;
  late FUIInputFieldController cityFieldCtrl;
  late FUIInputFieldController postCodeFieldCtrl;
  late FUIInputFieldSelectController geoCountryFieldCtrl;
  late FUIInputFieldSelectController geoStateFieldCtrl;
  late FUIButtonController prevBtnCtrl;
  late FUIButtonController nextBtnCtrl;

  @override
  void initState() {
    super.initState();

    _initBloc();

    // Load the geo states data after the build process
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadGeoStates();
    });
  }

  _initBloc() {
    address1FieldCtrl = FUIInputFieldController();
    address2FieldCtrl = FUIInputFieldController();
    cityFieldCtrl = FUIInputFieldController();
    postCodeFieldCtrl = FUIInputFieldController();
    geoCountryFieldCtrl = FUIInputFieldSelectController();
    geoStateFieldCtrl = FUIInputFieldSelectController();

    prevBtnCtrl = FUIButtonController(fuiButtonEvent: FUIButtonEvent(enable: true));
    nextBtnCtrl = FUIButtonController(fuiButtonEvent: FUIButtonEvent(enable: false));
  }

  @override
  void dispose() {
    address1FieldCtrl.close();
    address2FieldCtrl.close();
    cityFieldCtrl.close();
    postCodeFieldCtrl.close();
    geoCountryFieldCtrl.close();
    geoStateFieldCtrl.close();

    prevBtnCtrl.close();
    nextBtnCtrl.close();

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
            if (!widget.wizardForm.address1Field.isPure) {
              _onChangeAddress1(widget.wizardForm.address1Field.value);
            }

            if (!widget.wizardForm.address2Field.isPure) {
              _onChangeAddress2(widget.wizardForm.address2Field.value);
            }

            if (!widget.wizardForm.cityField.isPure) {
              _onChangeCity(widget.wizardForm.cityField.value);
            }

            if (!widget.wizardForm.postCodeField.isPure) {
              _onChangePostCode(widget.wizardForm.postCodeField.value);
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
                        visible: responsiveValue(context, lg: true, md: false, sm: false, xs: false),
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
            LineAwesomeIcons.truck_solid,
            size: 65,
          ),
          FUISpacer.vSpace10,
          H3(Text('Delivery Info')),
          FUISpacer.vSpace5,
          Regular(Text('Please fill in the details of the product delivery destination.'))
        ],
      ),
    );
  }

  _buildForm() {
    EdgeInsets eiSidePadding = EdgeInsets.only(right: 20);

    return FUISectionContainer(
      child: FUIColumn(
        children: [
          H3(
            padding: eiSidePadding,
            Text('Delivery Address'),
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
                    fuiInputFieldController: address1FieldCtrl,
                    initialValue: widget.wizardForm.address1Field.value,
                    minWidth: double.infinity,
                    label: 'Address Line 1',
                    hint: 'E.g. 27 Muraban Road',
                    mandatory: true,
                    maxLength: 250,
                    onChanged: (value) => _onChangeAddress1(value),
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
                    fuiInputFieldController: address2FieldCtrl,
                    initialValue: widget.wizardForm.address2Field.value,
                    minWidth: double.infinity,
                    label: 'Address Line 2',
                    hint: '(Optional)',
                    maxLength: 250,
                    onChanged: (value) => _onChangeAddress2(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                lg: 12,
                xl: 8,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: cityFieldCtrl,
                    initialValue: widget.wizardForm.cityField.value,
                    mandatory: true,
                    label: 'City',
                    hint: 'E.g. Sydney',
                    maxLength: 250,
                    onChanged: (value) => _onChangeCity(value),
                  ),
                ),
              ),
              ResponsiveGridCol(
                lg: 12,
                xl: 4,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputText(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldController: postCodeFieldCtrl,
                    initialValue: widget.wizardForm.postCodeField.value,
                    mandatory: true,
                    label: 'Zip/Postcode',
                    hint: '4/5 digits Zip/Postcode',
                    maxLength: 5,
                    onChanged: (value) => _onChangePostCode(value),
                  ),
                ),
              ),
            ],
          ),
          FUISpacer.vSpace15,
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xl: 6,
                lg: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: _buildGeoCountrySelect(),
                ),
              ),
              ResponsiveGridCol(
                xl: 6,
                lg: 12,
                child: Padding(
                  padding: eiSidePadding,
                  child: FUIInputSelect(
                    fuiInputSize: FUIInputSize.small,
                    fuiInputFieldSelectController: geoStateFieldCtrl,
                    enabled: false,
                    label: 'State',
                    hint: 'Select one',
                    dataList: [
                      SingleCategoryModel(
                        singleItemCategoryList: [SingleItemCategoryModel(value: '', nameSingleItem: 'Please wait...')],
                      ),
                    ],
                    onChanged: (value) => _onChangeGeoState(value),
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

  _buildGeoCountrySelect() {
    List<SingleItemCategoryModel> itemList = [
      SingleItemCategoryModel(value: 'AU', nameSingleItem: 'Australia'),
      SingleItemCategoryModel(value: 'US', nameSingleItem: 'United States'),
    ];

    List<SingleItemCategoryModel> selectedItemList = [];

    if (!widget.wizardForm.geoCountryField.isPure) {
      for (var item in itemList) {
        if (item.value == widget.wizardForm.geoCountryField.value) {
          selectedItemList.add(item);
          break;
        }
      }
    } else {
      selectedItemList.add(SingleItemCategoryModel(value: 'AU', nameSingleItem: 'Australia'));
    }

    return FUIInputSelect(
      fuiInputSize: FUIInputSize.small,
      fuiInputFieldSelectController: geoCountryFieldCtrl,
      label: 'Country Code',
      hint: 'Select one',
      dataList: [
        SingleCategoryModel(
          singleItemCategoryList: itemList,
        )
      ],
      selectedDataList: selectedItemList,
      onChanged: (value) {
        _onChangeGeoCountry(value);

        _loadGeoStates();
      },
    );
  }

  _loadGeoStates() {
    var countryCode = widget.wizardForm.geoCountryField.value;
    var jsonFile = 'demo-data/geo-state-$countryCode.json';

    geoStateFieldCtrl.trigger(FUIInputFieldSelectEvent(
      enabled: false,
    ));

    rootBundle.loadString(jsonFile).then((data) {
      List<dynamic> dataList = jsonDecode(data);
      List<SingleItemCategoryModel> itemList = [];
      List<SingleItemCategoryModel> selectedItemList = []; // only 1 item

      for (var data in dataList) {
        var name = data['name'];
        var abbreviation = data['abbreviation'];

        SingleItemCategoryModel item = SingleItemCategoryModel(value: abbreviation, nameSingleItem: name);
        itemList.add(item);

        if (!widget.wizardForm.geoStateField.isPure && selectedItemList.isNotEmpty && widget.wizardForm.geoStateField.value == item.value) {
          selectedItemList.add(item);
        }
      }

      /// Just select the 1st item
      if (selectedItemList.isEmpty) {
        selectedItemList.add(itemList[0]);
      }

      var modelList = [
        SingleCategoryModel(
          singleItemCategoryList: itemList,
        ),
      ];

      geoStateFieldCtrl.trigger(FUIInputFieldSelectEvent(
        dataList: modelList,
        selectedDataList: selectedItemList,
        enabled: true,
      ));
    });
  }

  _onChangeAddress1(value) {
    widget.wizardForm.address1Field = Address1Field.dirty(value: value);
    Address1FieldError? err = widget.wizardForm.address1Field.validator(value);

    switch (err) {
      case Address1FieldError.empty:
        address1FieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case Address1FieldError.tooLong:
        address1FieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        address1FieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeAddress2(value) {
    widget.wizardForm.address2Field = Address2Field.dirty(value: value);
    Address2FieldError? err = widget.wizardForm.address2Field.validator(value);

    switch (err) {
      case Address2FieldError.tooLong:
        address1FieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        address1FieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeCity(value) {
    widget.wizardForm.cityField = CityField.dirty(value: value);
    CityFieldError? err = widget.wizardForm.cityField.validator(value);

    switch (err) {
      case CityFieldError.empty:
        cityFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case CityFieldError.tooLong:
        cityFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        cityFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangePostCode(value) {
    widget.wizardForm.postCodeField = PostCodeField.dirty(value: value);
    PostCodeFieldError? err = widget.wizardForm.postCodeField.validator(value);

    switch (err) {
      case PostCodeFieldError.empty:
        postCodeFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case PostCodeFieldError.notDigits:
        postCodeFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Only digits please.',
        ));
        break;
      case PostCodeFieldError.tooLong:
        postCodeFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please limit this to 250 characters.',
        ));
        break;
      default:
        postCodeFieldCtrl.trigger(FUIInputFieldEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeGeoCountry(value) {
    widget.wizardForm.geoCountryField = GeoCountryField.dirty(value: value);
    GeoCountryFieldError? err = widget.wizardForm.geoCountryField.validator(value);

    switch (err) {
      case GeoCountryFieldError.empty:
        geoCountryFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case GeoCountryFieldError.invalid:
        geoCountryFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid State Code.',
        ));
        break;
      default:
        geoCountryFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _onChangeGeoState(value) {
    widget.wizardForm.geoStateField = GeoStateField.dirty(value: value);
    GeoStateFieldError? err = widget.wizardForm.geoStateField.validator(value);

    switch (err) {
      case GeoStateFieldError.empty:
        geoStateFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Please don\'t leave this empty',
        ));
        break;
      case GeoStateFieldError.invalid:
        geoStateFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.error,
          fuiInputStatusText: 'Invalid State Code.',
        ));
        break;
      default:
        geoStateFieldCtrl.trigger(FUIInputFieldSelectEvent(
          fuiInputStatusType: FUIInputStatusType.success,
          fuiInputStatusText: '',
        ));
        break;
    }

    _areAllFieldsInPageOk();
  }

  _areAllFieldsInPageOk() {
    bool enable = widget.wizardForm.address1Field.isValid &&
        widget.wizardForm.address2Field.isValid &&
        widget.wizardForm.cityField.isValid &&
        widget.wizardForm.postCodeField.isValid &&
        widget.wizardForm.geoCountryField.isValid &&
        widget.wizardForm.geoStateField.isValid;

    nextBtnCtrl.trigger(FUIButtonEvent(enable: enable));
  }
}
