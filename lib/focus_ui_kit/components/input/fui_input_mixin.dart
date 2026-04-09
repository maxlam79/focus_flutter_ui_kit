import 'package:flutter/material.dart';

import '../../exports.dart';

mixin FUIInputMixin {
  /// Styles Parameters
  late TextStyle textStyle;
  late TextStyle hintStyle;
  late EdgeInsets contentPadding;
  late Color containerBorderColor;

  /// Text Input Components
  late FocusNode focusNode;
  late TextEditingController textEditingController;
  late String initialValue;
  late Widget mandatoryIndicator;
  late Widget inputFieldLabel;

  /// Flags and Attributes
  bool isFocused = false;
  bool isReadOnly = false;
  bool isEnabled = true;
  bool? isPopoverOrDialogShow;
  FUIInputStatusType inputStatusType = FUIInputStatusType.normal;
  String? inputStatusText;
  FUIInputLabelShrinkController labelShrinkCtrl = FUIInputLabelShrinkController(false);

  initOtherTextInputRelatedComponents(Key fuiInputLabelKey, dynamic widget) {
    isReadOnly = widget.readOnly;
    isEnabled = widget.enabled ?? true;
    inputStatusType = widget.fuiInputStatusType ?? FUIInputStatusType.normal;
    inputStatusText = widget.fuiInputStatusText;

    if (widget.label != null) {
      inputFieldLabel = FUIInputLabel(
        key: fuiInputLabelKey,
        fuiInputLabelShrinkController: labelShrinkCtrl,
        label: Text(widget.label),
      );
    } else {
      inputFieldLabel = FUIInputLabel(
        key: fuiInputLabelKey,
        fuiInputLabelShrinkController: labelShrinkCtrl,
      );
    }
  }

  initTextEditingController(dynamic widget) {
    try {
      initialValue = widget.initialValue ?? '';
    } catch (e) {
      // Absorb
    }

    textEditingController =
        widget.textEditingController ?? TextEditingController(text: initialValue);
    textEditingController.addListener(() {
      discernTitleResize(widget);
    });
  }

  initTextEditingControllerForSelect(dynamic widget) {
    textEditingController = widget.textEditingController ?? TextEditingController();
    textEditingController.addListener(() {
      discernTitleResize(widget);
    });

    if (widget.selectedDataList != null && widget.selectedDataList.isNotEmpty) {
      String valueStr = '';

      // TODO: Multi select
      // if (widget.isMultiSelect) {
      //   for (int i = 0; i < widget.selectedDataList.length; i++) {
      //     if (i > 0) {
      //       valueStr += widget.multiSelectValueDelimiter;
      //     }
      //
      //     valueStr += widget.selectedDataList[i].value.toString();
      //   }
      // } else {
      //   valueStr = widget.selectedDataList[0].value.toString();
      // }

      valueStr = widget.selectedDataList[0].value.toString();

      textEditingController.text = valueStr;
    }
  }

  initFocusNode(dynamic widget) {
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        // Happens only for 1st time focus
        if (!isFocused && widget.selectAllOnFocus) {
          textEditingController.selection =
              TextSelection(baseOffset: 0, extentOffset: textEditingController.value.text.length);
        }

        isFocused = true;
        discernTitleResize(widget);
      } else {
        isFocused = false;
        discernTitleResize(widget);
      }
    });
  }

  buildMandatoryIndicator(BuildContext context, dynamic widget) {
    FUIInputTheme fuiInputTheme = context.theme.fuiInput;

    if (widget.mandatory) {
      mandatoryIndicator = Padding(
        padding: FUIInputTheme.paddingMandatoryIndicator,
        child: widget.mandatoryIndicator ??
            Text(
              FUIInputTheme.defaultMandatoryCharacter,
              style: fuiInputTheme.tsMandatory,
            ),
      );
    } else {
      mandatoryIndicator = Text(
        '',
        style: fuiInputTheme.tsMandatory,
      );
    }
  }

  InputDecoration buildInputDecoration(dynamic widget) {
    return InputDecoration(
      contentPadding: contentPadding,
      isDense: true,
      border: InputBorder.none,
      hintText: (widget.hint != null) ? widget.hint! : null,
      hintStyle: hintStyle,
      counterText: '',
    );
  }

  Widget buildSideIcon(BuildContext context, dynamic widget) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    if (widget.sideIcon != null) {
      return Container(
        padding: FUIInputTheme.paddingSideIconContainer,
        alignment: Alignment.center,
        child: IconTheme.merge(
          data: IconThemeData(
            size: FUIInputTheme.sizeSideIcon,
            color: fuiColors.shade3,
          ),
          child: widget.sideIcon,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildStatusContainer(BuildContext context, dynamic widget) {
    FUIInputTheme fuiInputTheme = context.theme.fuiInput;

    TextStyle? statusStyle;

    switch (inputStatusType) {
      case FUIInputStatusType.success:
        statusStyle = fuiInputTheme.tsStatusSuccess;
        break;
      case FUIInputStatusType.complete:
        statusStyle = fuiInputTheme.tsStatusComplete;
        break;
      case FUIInputStatusType.warning:
        statusStyle = fuiInputTheme.tsStatusWarn;
        break;
      case FUIInputStatusType.error:
        statusStyle = fuiInputTheme.tsStatusError;
        break;
      case FUIInputStatusType.normal:
      default:
        statusStyle = fuiInputTheme.tsStatusNormal;
        break;
    }

    Widget w;

    if (inputStatusText != null) {
      w = DefaultTextStyle(
        style: statusStyle,
        child: Text(inputStatusText!),
      );
    } else {
      w = const SizedBox.shrink();
    }

    return SizedBox(
      height: FUIInputTheme.sizeStatusTextTopMargin,
      child: w,
    );
  }

  discernContainerBorderColor(BuildContext context, dynamic widget) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    switch (inputStatusType) {
      case FUIInputStatusType.success:
        containerBorderColor = fuiColors.statusSuccess;
        break;
      case FUIInputStatusType.complete:
        containerBorderColor = fuiColors.statusComplete;
        break;
      case FUIInputStatusType.warning:
        containerBorderColor = fuiColors.statusWarning;
        break;
      case FUIInputStatusType.error:
        containerBorderColor = fuiColors.statusError;
        break;
      case FUIInputStatusType.normal:
      default:
        containerBorderColor = fuiColors.shade2;
        break;
    }
  }

  discernStyleParams(BuildContext context, dynamic widget) {
    FUIInputTheme fuiInputTheme = context.theme.fuiInput;

    if (widget.textStyle == null) {
      switch (widget.fuiInputSize) {
        case FUIInputSize.small:
          textStyle = fuiInputTheme.tsValueSmall;
          hintStyle = fuiInputTheme.tsHintSmall;
          contentPadding = FUIInputTheme.paddingContentSmall;
          break;
        case FUIInputSize.large:
          textStyle = fuiInputTheme.tsValueLarge;
          hintStyle = fuiInputTheme.tsHintLarge;
          contentPadding = FUIInputTheme.paddingContentLarge;
          break;
        case FUIInputSize.medium:
        default:
          textStyle = fuiInputTheme.tsValueMedium;
          hintStyle = fuiInputTheme.tsHintMedium;
          contentPadding = FUIInputTheme.paddingContentMedium;
          break;
      }
    } else {
      textStyle = widget.textStyle!;
      hintStyle = widget.textStyle!;
    }
  }

  Color discernContainerBackgroundColor(BuildContext context, dynamic widget) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    if (isEnabled) {
      return fuiColors.shade0;
    } else {
      return fuiColors.shade1;
    }
  }

  discernTitleResize(dynamic widget) {
    bool hasContent = textEditingController.value.text.isNotEmpty;

    if (hasContent) {
      labelShrinkCtrl.trigger(true);
    } else if (isFocused) {
      labelShrinkCtrl.trigger(true);
    } else if (hasContent) {
      labelShrinkCtrl.trigger(true);
    } else if (!isFocused && hasContent) {
      labelShrinkCtrl.trigger(true);
    } else if (!isFocused && !hasContent) {
      labelShrinkCtrl.trigger(false);
    } else if (isPopoverOrDialogShow != null && (isPopoverOrDialogShow!)) {
      labelShrinkCtrl.trigger(true);
    } else if (isPopoverOrDialogShow != null && (!isPopoverOrDialogShow!)) {
      labelShrinkCtrl.trigger(false);
    }
  }
}

mixin FUIInputRadioCheckboxMixin {
  /// Essentials
  late FUIThemeCommonColors fuiColors;
  late FUIInputTheme fuiInputTheme;

  /// Flags and attributes
  bool isFocused = false;
  bool isReadOnly = false;
  bool isEnabled = true;
  late double scale;

  discernSize(dynamic widget) {
    switch (widget.fuiInputSize) {
      case FUIInputSize.small:
        scale = FUIInputTheme.sizeRadioSmallScale;
        break;
      case FUIInputSize.large:
        scale = FUIInputTheme.sizeRadioLargeScale;
        break;
      case FUIInputSize.medium:
      default:
        scale = FUIInputTheme.sizeRadioMediumScale;
        break;
    }
  }
}
