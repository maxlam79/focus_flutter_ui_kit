import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exports.dart';

class FUIInputText extends StatefulWidget {
  final FUIColorScheme fuiColorScheme;
  final FUIInputFieldController? fuiInputFieldController;
  final String? label;
  final String? hint;
  final bool mandatory;
  final Widget? mandatoryIndicator;
  final bool showTopLabelBar;
  final TextEditingController? textEditingController;
  final String? initialValue;
  final FocusNode? focusNode;
  final bool selectAllOnFocus;
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
  final List<TextInputFormatter>? inputFormatters;
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

  FUIInputText({
    Key? key,
    this.fuiColorScheme = FUIColorScheme.primary,
    this.fuiInputFieldController,
    this.label,
    this.hint,
    this.mandatory = false,
    this.mandatoryIndicator,
    this.showTopLabelBar = true,
    this.textEditingController,
    this.initialValue,
    this.focusNode,
    this.selectAllOnFocus = true,
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
    this.inputFormatters,
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
  State<FUIInputText> createState() => _FUIInputTextState();
}

class _FUIInputTextState extends State<FUIInputText> with FUIInputMixin, FUIColorMixin {
  /// Bloc
  late FUIInputFieldController ifCtrl;
  bool blocProviderCreateNew = false;

  /// Keys
  GlobalKey inputLabelKey = GlobalKey();
  GlobalKey textFormFieldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _initBloc();

    initOtherTextInputRelatedComponents(inputLabelKey, widget);
    initTextEditingController(widget);
    initFocusNode(widget);
  }

  _initBloc() {
    if (widget.fuiInputFieldController == null) {
      blocProviderCreateNew = true;
    }

    ifCtrl = widget.fuiInputFieldController ?? FUIInputFieldController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    discernStyleParams(context, widget);
    buildMandatoryIndicator(context, widget);

    WidgetsBinding.instance.addPostFrameCallback((_) => discernTitleResize(widget));

    bf(BuildContext context, FUIInputFieldEvent? event) {
      _handleBlocEvent(event);

      discernContainerBorderColor(context, widget);

      List<Widget> mainContent = [];

      if (widget.sideIcon != null) {
        if (widget.fuiInputSideIconPosition == FUIInputSideIconPosition.left) {
          mainContent.add(
            Container(
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
            ),
          );
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

      innerContent.add(_buildTextFormField(context));

      mainContent.add(
        // Input Field Side
        Expanded(
          child: Container(
            margin: EdgeInsets.zero,
            padding: FUIInputTheme.paddingContainer,
            child: FUIColumn(
              children: innerContent,
            ),
          ),
        ),
      );

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
        ),
      );

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
        create: (_) => ifCtrl,
        child: BlocBuilder(
          bloc: ifCtrl,
          builder: bf,
        ),
      );
    } else {
      return BlocProvider.value(
        value: ifCtrl,
        child: BlocBuilder(
          bloc: ifCtrl,
          builder: bf,
        ),
      );
    }
  }

  Widget _buildTextFormField(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;

    return Theme(
      data: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          selectionColor: fuiColors.shade2,
        ),
      ),
      child: TextFormField(
        key: textFormFieldKey,
        controller: textEditingController,
        focusNode: focusNode,
        decoration: buildInputDecoration(widget),
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        style: textStyle,
        strutStyle: widget.strutStyle,
        textDirection: widget.textDirection,
        textAlign: widget.textAlign,
        textAlignVertical: widget.textAlignVertical,
        autofocus: widget.autofocus,
        readOnly: isReadOnly,
        showCursor: widget.showCursor,
        obscuringCharacter: widget.obscuringCharacter,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        smartDashesType: widget.smartDashesType,
        smartQuotesType: widget.smartQuotesType,
        enableSuggestions: widget.enableSuggestions,
        maxLengthEnforcement: widget.maxLengthEnforcement,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onTapOutside: widget.onTapOutside,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        enabled: isEnabled,
        cursorWidth: widget.cursorWidth,
        cursorHeight: widget.cursorHeight,
        cursorRadius: widget.cursorRadius,
        cursorColor: widget.cursorColor ??
            discernColorByScheme(context, fuiColorScheme: widget.fuiColorScheme),
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        selectionControls: widget.selectionControls,
        buildCounter: widget.buildCounter,
        scrollPhysics: widget.scrollPhysics,
        autofillHints: widget.autofillHints,
        autovalidateMode: widget.autovalidateMode,
        scrollController: widget.scrollController,
        restorationId: widget.restorationId,
        enableIMEPersonalizedLearning: widget.enableIMEPersonalizedLearning,
        mouseCursor: widget.mouseCursor,
      ),
    );
  }

  _handleBlocEvent(FUIInputFieldEvent? event) {
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
    }
  }
}
