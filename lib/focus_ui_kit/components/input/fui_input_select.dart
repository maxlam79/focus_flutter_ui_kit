import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:select2dot1/select2dot1.dart';

import '../../exports.dart';

class FUIInputSelect extends StatefulWidget {
  final FUIColorScheme fuiColorScheme;
  final FUIInputFieldSelectController? fuiInputFieldSelectController;
  final String? label;
  final String? hint;
  final bool mandatory;
  final Widget? mandatoryIndicator;
  final bool showTopLabelBar;
  final List<SingleCategoryModel> dataList;
  final List<SingleItemCategoryModel>? selectedDataList;

  // final bool isMultiSelect;  // TODO: multiple select pending...
  final bool isSearchable;

  // final String multiSelectValueDelimiter;  // TODO: multiple select pending...
  final bool avatarInSingleSelect;

  // final bool extraInfoInSingleSelect;
  final bool extraInfoInDropdown;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final FUIInputSize fuiInputSize;
  final double? minWidth;
  final FUIInputStatusType fuiInputStatusType;
  final String? fuiInputStatusText;
  final Widget? sideIcon;
  final FUIInputSideIconPosition fuiInputSideIconPosition;
  final Color? sideIconBackgroundColor;
  final TextCapitalization textCapitalization;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextStyle? textStyle;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final TextAlign textAlign;
  final TextAlignVertical? textAlignVertical;
  final bool autofocus;
  final bool readOnly;
  final bool? showCursor;
  final String obscuringCharacter;
  final bool obscureText;
  final bool autocorrect;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final bool enableSuggestions;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final int maxLines;
  final int? minLines;
  final bool expands;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final TapRegionCallback? onTapOutside;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter? onSaved;
  final FormFieldValidator? validator;
  final bool? enabled;
  final Duration? enableOpacityAniDuration;
  final Curve? enableOpacityAniCurve;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final Brightness? keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool? enableInteractiveSelection;
  final TextSelectionControls? selectionControls;
  final InputCounterWidgetBuilder? buildCounter;
  final ScrollPhysics? scrollPhysics;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final MouseCursor? mouseCursor;

  FUIInputSelect({
    Key? key,
    this.fuiColorScheme = FUIColorScheme.primary,
    this.fuiInputFieldSelectController,
    this.label,
    this.hint,
    this.mandatory = false,
    this.mandatoryIndicator,
    this.showTopLabelBar = true,
    required this.dataList,
    this.selectedDataList,
    // this.isMultiSelect = false,
    this.isSearchable = true,
    // this.multiSelectValueDelimiter = FUIInputTheme.defaultMultiSelectValueDelimiter,
    this.avatarInSingleSelect = false,
    // this.extraInfoInSingleSelect = false,
    this.extraInfoInDropdown = false,
    this.textEditingController,
    this.focusNode,
    this.fuiInputSize = FUIInputSize.medium,
    this.minWidth = FUIInputTheme.minWidth,
    this.fuiInputStatusType = FUIInputStatusType.normal,
    this.fuiInputStatusText,
    this.sideIcon,
    this.fuiInputSideIconPosition = FUIInputSideIconPosition.right,
    this.sideIconBackgroundColor,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.keyboardType,
    this.textStyle,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.textAlignVertical,
    this.autofocus = false,
    this.readOnly = false,
    this.showCursor,
    this.obscuringCharacter = '*',
    this.obscureText = false,
    this.autocorrect = true,
    this.smartDashesType,
    this.smartQuotesType,
    this.enableSuggestions = true,
    this.maxLengthEnforcement,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onTapOutside,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.enableOpacityAniDuration,
    this.enableOpacityAniCurve,
    this.cursorWidth = FUIInputTheme.sizeCursorWidth,
    this.cursorHeight,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection,
    this.selectionControls,
    this.buildCounter,
    this.scrollPhysics,
    this.autofillHints,
    this.autovalidateMode,
    this.scrollController,
    this.restorationId,
    this.enableIMEPersonalizedLearning = true,
    this.mouseCursor,
  }) : super(key: key ?? UniqueKey());

  @override
  State<FUIInputSelect> createState() => _FUIInputSelectState();
}

class _FUIInputSelectState extends State<FUIInputSelect> with FUIInputMixin, FUIColorMixin {
  /// Bloc
  late FUIInputFieldSelectController ifsCtrl;
  bool blocProviderCreateNew = false;

  /// Flags and Attributes
  late SelectDataController selectDataController;
  late Select2dot1 select2dot1;
  late bool isMultiSelect;
  late List<SingleCategoryModel> dataList;
  late List<SingleItemCategoryModel>? selectedDataList;

  /// Keys
  GlobalKey inputLabelKey = GlobalKey();
  GlobalKey select2dot1Key = GlobalKey();

  // Themes
  late FUIThemeCommonColors fuiColors;
  late FUITypographyTheme typoTheme;
  late FUIInputTheme inputTheme;

  @override
  void initState() {
    super.initState();

    _initBloc();

    initOtherTextInputRelatedComponents(inputLabelKey, widget);
    initTextEditingControllerForSelect(widget);
    initFocusNode(widget);

    _initData();
  }

  _initBloc() {
    if (widget.fuiInputFieldSelectController == null) {
      blocProviderCreateNew = true;
    }

    ifsCtrl = widget.fuiInputFieldSelectController ?? FUIInputFieldSelectController();
  }

  _initData() {
    dataList = widget.dataList;

    if (widget.selectedDataList != null && widget.selectedDataList!.isNotEmpty) {
      selectedDataList = widget.selectedDataList;
    } else {
      selectedDataList = null;
    }

    // isMultiSelect = widget.isMultiSelect;
    isMultiSelect = false;

    selectDataController = SelectDataController(
      data: dataList,
      initSelected: selectedDataList,
      isMultiSelect: isMultiSelect,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;
    typoTheme = context.theme.fuiTypography;
    inputTheme = context.theme.fuiInput;

    buildMandatoryIndicator(context, widget);

    bf(BuildContext context, FUIInputFieldSelectEvent? event) {
      _handleBlocEvent(event);

      discernContainerBorderColor(context, widget);

      List<Widget> mainContent = [];

      if (widget.sideIcon != null) {
        if (widget.fuiInputSideIconPosition == FUIInputSideIconPosition.left) {
          mainContent.add(Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: widget.sideIconBackgroundColor ?? fuiColors.shade1,
              border: Border(
                right: BorderSide(
                  color: containerBorderColor,
                  width: FUIInputTheme.sizeContainerBorderThickness,
                ),
              ),
            ),
            child: buildSideIcon(context, widget),
          ));
        }
      }

      List<Widget> innerContent = [];

      if (widget.showTopLabelBar) {
        innerContent.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            inputFieldLabel,
            mandatoryIndicator,
          ],
        ));
      }

      innerContent.add(_buildSelectFormField(context));

      mainContent.add(Expanded(
        child: Container(
          margin: EdgeInsets.zero,
          padding: FUIInputTheme.paddingContainer,
          child: FUIColumn(
            children: innerContent,
          ),
        ),
      ));

      if (widget.sideIcon != null) {
        if (widget.fuiInputSideIconPosition == FUIInputSideIconPosition.right) {
          mainContent.add(Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: widget.sideIconBackgroundColor ?? fuiColors.shade1,
              border: Border(
                left: BorderSide(
                  color: containerBorderColor,
                  width: FUIInputTheme.sizeContainerBorderThickness,
                ),
              ),
            ),
            child: buildSideIcon(context, widget),
          ));
        }
      }

      Widget inputFieldContainer = Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: widget.minWidth,
          decoration: BoxDecoration(
            color: discernContainerBackgroundColor(context, widget),
            shape: BoxShape.rectangle,
            border: Border.all(
              width: FUIInputTheme.sizeContainerBorderThickness,
              color: containerBorderColor,
            ),
            borderRadius: FUIInputTheme.sizeBorderRadius,
          ),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: mainContent,
            ),
          ));

      return AbsorbPointer(
        absorbing: isReadOnly,
        child: AnimatedOpacity(
          duration: widget.enableOpacityAniDuration ?? FUIInputTheme.enableOpacityAniDuration,
          curve: widget.enableOpacityAniCurve ?? FUIInputTheme.enableOpacityAniCurve,
          opacity:
              isEnabled ? FUIInputTheme.enableOpacityNormal : FUIInputTheme.enableOpacityDisabled,
          child: FUIColumn(
            children: [
              inputFieldContainer,
              FUISpacer.vSpace3,
              buildStatusContainer(context, widget),
            ],
          ),
        ),
      );
    }

    if (blocProviderCreateNew) {
      return BlocProvider(
        create: (_) => ifsCtrl,
        child: BlocBuilder(
          bloc: ifsCtrl,
          builder: bf,
        ),
      );
    } else {
      return BlocProvider.value(
        value: ifsCtrl,
        child: BlocBuilder(
          bloc: ifsCtrl,
          builder: bf,
        ),
      );
    }
  }

  Widget _buildSelectFormField(BuildContext context) {
    _buildSelect2dot1(context);

    return select2dot1;
  }

  _buildSelect2dot1(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUIInputTheme fuiInputTheme = context.theme.fuiInput;
    TextStyle inputHint,
        inputValue,
        inputFieldSelectCategoryItemOverlay,
        inputSelectCategoryItemOverlaySelected,
        inputSelectCategoryName,
        inputSelectCategoryNameModal;

    switch (widget.fuiInputSize) {
      case FUIInputSize.small:
        inputHint = fuiInputTheme.tsHintSmall;
        inputValue = fuiInputTheme.tsSelectValueSmall;
        inputFieldSelectCategoryItemOverlay = fuiInputTheme.tsSelectCategoryItemOverlaySmall;
        inputSelectCategoryItemOverlaySelected =
            fuiInputTheme.tsSelectCategoryItemOverlaySelectedSmall;
        inputSelectCategoryName = fuiInputTheme.tsSelectCatNameSmall;
        inputSelectCategoryNameModal = fuiInputTheme.tsSelectCategoryNameModalSmall;
        break;
      case FUIInputSize.large:
        inputHint = fuiInputTheme.tsHintLarge;
        inputValue = fuiInputTheme.tsSelectValueLarge;
        inputFieldSelectCategoryItemOverlay = fuiInputTheme.tsSelectCategoryItemOverlayLarge;
        inputSelectCategoryItemOverlaySelected =
            fuiInputTheme.tsSelectCategoryItemOverlaySelectedLarge;
        inputSelectCategoryName = fuiInputTheme.tsSelectCatNameLarge;
        inputSelectCategoryNameModal = fuiInputTheme.tsSelectCategoryNameModalLarge;
        break;
      case FUIInputSize.medium:
      default:
        inputHint = fuiInputTheme.tsHintMedium;
        inputValue = fuiInputTheme.tsSelectValueMedium;
        inputFieldSelectCategoryItemOverlay = fuiInputTheme.tsSelectCategoryItemOverlayMedium;
        inputSelectCategoryItemOverlaySelected =
            fuiInputTheme.tsSelectCategoryItemOverlaySelectedMedium;
        inputSelectCategoryName = fuiInputTheme.tsSelectCatNameMedium;
        inputSelectCategoryNameModal = fuiInputTheme.tsSelectCategoryNameModalMedium;
        break;
    }

    select2dot1 = Select2dot1(
      key: select2dot1Key,
      selectDataController: selectDataController,
      isSearchable: widget.isSearchable,
      onChanged: (selectedValueList) {
        if (isMultiSelect) {
          var itr = selectedValueList.iterator;
          // TODO: Multiple selected
          // String delimiter = widget.multiSelectValueDelimiter ?? ';';
          String delimiter = ';';
          String values = '';
          int count = 0;

          while (itr.moveNext()) {
            if (count > 0) {
              values += delimiter;
            }

            values += itr.current.value.toString();
          }

          textEditingController.text = values;

          if (widget.onChanged != null) {
            widget.onChanged!(values);
          }
        } else {
          if (selectedValueList.isNotEmpty && selectedValueList.single.value != null) {
            textEditingController.text = selectedValueList.single.value.toString();
          } else {
            textEditingController.text = '';
          }

          // TODO: Need to think of a way to handle unselect... it's here, right here...
          if (widget.onChanged != null) {
            if (selectedValueList.isNotEmpty && selectedValueList.single.value != null) {
              widget.onChanged!(selectedValueList.single.value.toString());
            } else {
              widget.onChanged!('');
            }
          }
        }
      },
      pillboxTitleSettings: const PillboxTitleSettings(
        title: '',
        titlePadding: EdgeInsets.zero,
        titleStyleDefault: TextStyle(
          fontSize: 0,
        ),
        titleStyleHover: TextStyle(
          fontSize: 0,
        ),
        titleStyleFocus: TextStyle(
          fontSize: 0,
        ),
      ),
      pillboxSettings: const PillboxSettings(
        constraints: BoxConstraints(
          maxHeight: FUIInputTheme.sizePillboxConstraintHeight,
        ),
        defaultDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.transparent),
          ),
        ),
        activeDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.transparent),
          ),
        ),
        hoverDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.transparent),
          ),
        ),
        focusDecoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
      pillboxIconSettings: PillboxIconSettings(
        padding: FUIInputTheme.paddingSelectIconIndicator,
        defaultColor: fuiColors.textBody,
        hoverColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
        focusColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
      ),
      selectEmptyInfoSettings: SelectEmptyInfoSettings(
        padding: EdgeInsets.zero,
        text: 'Please select.',
        textStyle: inputHint,
      ),
      pillboxContentMultiSettings: const PillboxContentMultiSettings(
        pillboxLayout: PillboxLayout.scroll,
      ),
      dropdownOverlaySettings: DropdownOverlaySettings(
        maxHeight: FUIInputTheme.sizeSelectDropdownOverlayHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.zero,
          color: fuiColors.shade0,
          border: Border.all(color: fuiColors.shade2),
        ),
        animationBuilder: (context, child, animationController) {
          // TODO: Here to add animation status hook, using animationController
          return SizeTransition(
            sizeFactor: CurvedAnimation(
              parent: animationController,
              curve: Curves.easeInOutQuart,
            ),
            child: child,
          );
        },
      ),
      searchBarOverlayBuilder: (context, searchBarOverlayDetails) {
        return Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: FUIInputTheme.paddingSelectSearchBarOverlay,
          margin: FUIInputTheme.marginSelectSearchBarOverlay,
          child: Row(
            children: [
              Padding(
                padding: FUIInputTheme.paddingSelectSearchBarOverlayIcon,
                child: Icon(
                  Icons.search,
                  color: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: searchBarOverlayDetails.searchBarController,
                  focusNode: searchBarOverlayDetails.searchBarFocusNode,
                  cursorColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
                  style: inputValue,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: widget.hint ?? 'Search',
                    hintStyle: inputHint,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      searchEmptyInfoOverlaySettings: SearchEmptyInfoOverlaySettings(
        textStyle: inputHint,
      ),
      listDataViewOverlaySettings: ListDataViewOverlaySettings(
          thumbColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme)),
      categoryNameOverlaySettings: CategoryNameOverlaySettings(
        constraints: const BoxConstraints(minHeight: 27),
        textStyle: inputSelectCategoryName,
        defaultDecoration: const BoxDecoration(color: Colors.transparent),
        hoverDecoration: BoxDecoration(
            color: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme)),
      ),
      categoryItemOverlaySettings: CategoryItemOverlaySettings(
        constraints: const BoxConstraints(minHeight: 35),
        defaultTextStyle: inputFieldSelectCategoryItemOverlay,
        selectedTextStyle: inputSelectCategoryItemOverlaySelected,
        iconSize: FUIInputTheme.sizeSelectCategoryItemOverlaySettingsIcon,
        iconSelectedColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
        defaultDecoration: const BoxDecoration(color: Colors.transparent),
        hoverDecoration: BoxDecoration(color: fuiColors.shade1),
        showExtraInfo: widget.extraInfoInDropdown,
        showAvatar: widget.avatarInSingleSelect,
      ),
      selectChipBuilder: (context, selectChipDetails) {
        // TODO: For multiple selection. Not used for now...
        return Container(
          height: 29,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          constraints: const BoxConstraints(maxWidth: 200),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
                color: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  selectChipDetails.singleItemCategory.nameSingleItem,
                  softWrap: false,
                  overflow: TextOverflow.ellipsis,
                  style: inputValue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0, left: 2.0),
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      selectChipDetails.selectDataController.removeSingleSelectedChip(
                        selectChipDetails.singleItemCategory,
                      );
                    },
                    child: Icon(
                      Icons.clear,
                      color: fuiColors.textBody,
                      size: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      selectSingleSettings: SelectSingleSettings(
        padding: EdgeInsets.zero,
        textStyle: inputValue,
        // showExtraInfo: widget.extraInfoInDropdown,
        showExtraInfo: false,
        // can't afford to have widget.extraInfoInSingleSelect because of height.
        showAvatar: widget.avatarInSingleSelect,
      ),
      scrollController: widget.scrollController,

      /// *********************************************
      /// *** This section is for Mobile Modal mode ***
      /// *********************************************
      searchBarModalBuilder: (context, searchBarModalDetails) {
        // For mobile
        return Container(
          height: 48,
          alignment: Alignment.centerLeft,
          padding: FUIInputTheme.paddingSelectSearchBarOverlay,
          margin: FUIInputTheme.marginSelectSearchBarOverlay,
          child: Row(
            children: [
              Padding(
                padding: FUIInputTheme.paddingSelectSearchBarOverlayIcon,
                child: Icon(
                  Icons.search,
                  color: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
                ),
              ),
              Expanded(
                child: TextField(
                  controller: searchBarModalDetails.searchBarModalController,
                  focusNode: searchBarModalDetails.searchBarModalFocusNode,
                  cursorColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
                  style: inputValue,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: widget.hint ?? 'Search',
                    hintStyle: inputHint,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      searchEmptyInfoModalSettings: SearchEmptyInfoModalSettings(
        // For Mobile
        textStyle: TextStyle(color: fuiColors.shade0),
      ),
      dropdownModalSettings: DropdownModalSettings(
        // For Mobile
        backgroundColor: fuiColors.bg0,
      ),
      categoryNameModalSettings: CategoryNameModalSettings(
        // For Mobile
        textStyle: inputSelectCategoryNameModal,
        textPadding: FUIInputTheme.paddingSelectCatNameModal,
      ),
      categoryItemModalSettings: CategoryItemModalSettings(
        // For Mobile
        constraints: const BoxConstraints(minHeight: 35),
        defaultTextStyle: inputFieldSelectCategoryItemOverlay,
        selectedTextStyle: inputSelectCategoryItemOverlaySelected,
        // ignore: avoid_redundant_argument_values
        iconSize: FUIInputTheme.sizeSelectCategoryItemOverlaySettingsIcon,
        iconSelectedColor: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
        showExtraInfo: widget.extraInfoInDropdown,
        showAvatar: widget.avatarInSingleSelect,
        splashColor: Colors.transparent,
      ),
      titleModalSettings: TitleModalSettings(
        // For mobile
        title: widget.label,
        titleTextStyle: fuiInputTheme.tsSelectTitleModal,
        titlePadding: FUIInputTheme.paddingSelectTitleModal,
      ),
      doneButtonModalSettings: DoneButtonModalSettings(
        // For Mobile
        buttonDecoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        textStyle: inputTheme.tsSelectModalDoneButton
            .copyWith(color: discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme)),
      ),
      selectOverloadInfoSettings: SelectOverloadInfoSettings(
        // For Mobile
        textStyle: TextStyle(color: fuiColors.textBody),
        padding: null,
      ),
    );
  }

  _handleBlocEvent(FUIInputFieldSelectEvent? event) {
    if (event != null) {
      if (event.enabled != null) {
        isEnabled = event.enabled!;
      }

      if (event.readOnly != null) {
        isReadOnly = event.readOnly!;
      }

      if (event.fuiInputStatusText != null) {
        inputStatusText = event.fuiInputStatusText!;
      }

      if (event.fuiInputStatusType != null) {
        inputStatusType = event.fuiInputStatusType!;
      }

      if (event.value != null) {
        textEditingController.text = event.value!;
      }

      if (event.dataList != null) {
        selectDataController.data = event.dataList!;
        selectDataController.clearSelectedList();

        if (event.selectedDataList != null && event.selectedDataList!.isNotEmpty) {
          selectedDataList = event.selectedDataList!;
          selectDataController.clearSelectedList();

          // TODO: Multiple selected
          selectDataController.setSingleSelect(event.selectedDataList![0]);

          // if (!widget.isMultiSelect) {
          //   selectDataController.setSingleSelect(event.selectedDataList![0]);
          // } else {
          //   selectDataController.addGroupSelectChip(selectedDataList);
          // }

          // Leave this...
          // selectDataController.addGroupSelectChip(event.selectedDataList!);
        }

        // Need to regenerate the select
        _buildSelect2dot1(context);
      } else if (event.selectedDataList != null) {
        selectedDataList = event.selectedDataList!;
        selectDataController.clearSelectedList();
        selectDataController.addGroupSelectChip(event.selectedDataList!);
      }
    }
  }
}
