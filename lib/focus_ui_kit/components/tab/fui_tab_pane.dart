import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../exports.dart';

class FUITabPane extends StatefulWidget {
  /// Head
  final FUITabPaneController? fuiTabPaneController;
  final List<FUITabItem> fuiTabItems;
  final FUITabHeadPosition fuiTabHeadPosition;
  final FUITabHeadLabelAlignment fuiTabHeadLabelAlignment;

  /// Content
  final FUIAnimationType? contentDisplayAniType;
  final Duration? contentDisplayAniDuration;
  final ValueSetter<Key>? onContentDisplayAniRendered;

  /// Pane attributes
  final double? width;
  final double? height;
  final BoxConstraints? constraints;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  FUITabPane({
    Key? key,
    this.fuiTabPaneController,
    required this.fuiTabItems,
    this.fuiTabHeadPosition = FUITabHeadPosition.topLeft,
    this.fuiTabHeadLabelAlignment = FUITabHeadLabelAlignment.center,
    this.contentDisplayAniType,
    this.contentDisplayAniDuration,
    this.onContentDisplayAniRendered,
    this.width,
    this.height,
    this.constraints,
    this.margin,
    this.padding,
  }) : super(key: key ?? UniqueKey());

  @override
  State<FUITabPane> createState() => _FUITabPaneState();
}

class _FUITabPaneState extends State<FUITabPane> {
  /// Theme
  late FUIThemeCommonColors fuiColors;

  /// Bloc
  bool blocProviderCreateNew = false;
  late FUITabPaneController tpCtrl;

  /// Animation
  GlobalKey<AnimatorWidgetState> aniGKey = GlobalKey<AnimatorWidgetState>();

  @override
  void initState() {
    super.initState();

    tpCtrl = widget.fuiTabPaneController ?? FUITabPaneController();

    if (widget.fuiTabPaneController == null) {
      blocProviderCreateNew = true;
    }
  }

  @override
  void dispose() {
    if (aniGKey.currentState != null) {
      aniGKey.currentState!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget headSection = _buildTabHead();
    Widget contentSection = _buildTabContentView();
    Widget w;

    switch (widget.fuiTabHeadPosition) {
      case FUITabHeadPosition.topRight:
        w = Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            headSection,
            contentSection,
          ],
        );
        break;
      case FUITabHeadPosition.bottomRight:
        w = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            contentSection,
            headSection,
          ],
        );
        break;
      case FUITabHeadPosition.leftTop:
        w = FUIRow(
          children: [
            headSection,
            contentSection,
          ],
        );
        break;
      case FUITabHeadPosition.rightTop:
        w = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contentSection,
            headSection,
          ],
        );
        break;
      case FUITabHeadPosition.leftBottom:
        w = FUIRow(
          children: [
            headSection,
            contentSection,
          ],
        );
        break;
      case FUITabHeadPosition.rightBottom:
        w = Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            contentSection,
            headSection,
          ],
        );
        break;
      case FUITabHeadPosition.bottomLeft:
        w = Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contentSection,
            headSection,
          ],
        );
        break;
      case FUITabHeadPosition.topLeft:
      default:
        w = FUIColumn(
          children: [
            headSection,
            contentSection,
          ],
        );
        break;
    }

    double maxWidth = (MediaQuery.of(context).size.width > FUITabTheme.defaultMaxWidth)
        ? FUITabTheme.defaultMaxWidth
        : MediaQuery.of(context).size.width;
    double maxHeight = (MediaQuery.of(context).size.height > FUITabTheme.defaultMaxHeight)
        ? FUITabTheme.defaultMaxHeight
        : MediaQuery.of(context).size.height;

    BoxConstraints? constraints = widget.constraints ??
        ((widget.width == null && widget.height == null)
            ? BoxConstraints(
                maxWidth: maxWidth,
                maxHeight: maxHeight,
              )
            : null);

    if (blocProviderCreateNew) {
      return BlocProvider(
        create: (_) => tpCtrl,
        child: Container(
          constraints: constraints,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: widget.padding,
          child: w,
        ),
      );
    } else {
      return BlocProvider.value(
        value: tpCtrl,
        child: Container(
          constraints: constraints,
          width: widget.width,
          height: widget.height,
          margin: widget.margin,
          padding: widget.padding,
          child: w,
        ),
      );
    }
  }

  Widget _buildTabHead() {
    Widget tabHeadWidget;

    switch (widget.fuiTabHeadPosition) {
      case FUITabHeadPosition.topRight:
      case FUITabHeadPosition.bottomRight:
        tabHeadWidget = FUISingleChildScrollView(
          scrollbarColor: Colors.transparent,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: widget.fuiTabItems,
          ),
        );
        break;
      case FUITabHeadPosition.leftTop:
      case FUITabHeadPosition.rightTop:
        tabHeadWidget = FUISingleChildScrollView(
          scrollbarColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: _getColumnCrossAxisAlignment(),
            children: widget.fuiTabItems,
          ),
        );
        break;
      case FUITabHeadPosition.leftBottom:
      case FUITabHeadPosition.rightBottom:
        tabHeadWidget = FUISingleChildScrollView(
          scrollbarColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: _getColumnCrossAxisAlignment(),
            children: widget.fuiTabItems,
          ),
        );
        break;
      case FUITabHeadPosition.topLeft:
      case FUITabHeadPosition.bottomLeft:
      default:
        tabHeadWidget = FUISingleChildScrollView(
          scrollbarColor: Colors.transparent,
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: widget.fuiTabItems,
          ),
        );
        break;
    }

    return tabHeadWidget;
  }

  CrossAxisAlignment _getColumnCrossAxisAlignment() {
    CrossAxisAlignment caa;

    switch (widget.fuiTabHeadLabelAlignment) {
      case FUITabHeadLabelAlignment.right:
        caa = CrossAxisAlignment.end;
        break;
      case FUITabHeadLabelAlignment.center:
        caa = CrossAxisAlignment.center;
        break;
      case FUITabHeadLabelAlignment.left:
      default:
        caa = CrossAxisAlignment.start;
        break;
    }

    return caa;
  }

  Widget _buildTabContentView() {
    return Expanded(
      child: _FUITabContentView(
        fuiTabPaneController: tpCtrl,
        fuiTabItems: widget.fuiTabItems,
        aniGKey: aniGKey,
        contentDisplayAniType: widget.contentDisplayAniType,
        contentDisplayAniDuration: widget.contentDisplayAniDuration,
        onContentDisplayAniRendered: widget.onContentDisplayAniRendered,
      ),
    );
  }
}

class _FUITabContentView extends StatefulWidget {
  final FUITabPaneController fuiTabPaneController;
  final List<FUITabItem> fuiTabItems;
  final GlobalKey<AnimatorWidgetState>? aniGKey;
  final FUIAnimationType? contentDisplayAniType;
  final Duration? contentDisplayAniDuration;
  final ValueSetter<Key>? onContentDisplayAniRendered;

  _FUITabContentView({
    Key? key,
    required this.fuiTabPaneController,
    required this.fuiTabItems,
    this.aniGKey,
    this.contentDisplayAniType,
    this.contentDisplayAniDuration,
    this.onContentDisplayAniRendered,
  }) : super(key: key ?? UniqueKey());

  @override
  State<_FUITabContentView> createState() => _FUITabContentViewState();
}

class _FUITabContentViewState extends State<_FUITabContentView> {
  /// Attributes and Flags
  Map<Key, Widget> itemContentMap = {};
  late Key selectedTabItemKey;
  late Widget selectedContent;
  bool requiresFirstEventTrigger = false;

  @override
  void initState() {
    super.initState();

    _initSelected();
  }

  _initSelected() {
    Key? tmpSelectedTabItemKey;
    Widget? tmpSelectedContent;

    for (var item in widget.fuiTabItems) {
      itemContentMap[item.key!] = item.content;

      if (item.initialSelected) {
        tmpSelectedTabItemKey = item.key!;
        tmpSelectedContent = item.content;
      }
    }

    if (tmpSelectedTabItemKey == null) {
      tmpSelectedTabItemKey = widget.fuiTabItems[0].key!;
      tmpSelectedContent = widget.fuiTabItems[0].content;
      requiresFirstEventTrigger = true;
    }

    selectedTabItemKey = tmpSelectedTabItemKey;
    selectedContent = tmpSelectedContent!;
  }

  @override
  Widget build(BuildContext context) {
    if (requiresFirstEventTrigger) {
      widget.fuiTabPaneController.trigger(
        FUITabPaneEvent(
          selectedTabItemKey: selectedTabItemKey,
        ),
      );

      requiresFirstEventTrigger = false;
    }

    return BlocBuilder(
      bloc: widget.fuiTabPaneController,
      builder: (BuildContext context, FUITabPaneEvent? event) {
        if (event != null) {
          selectedTabItemKey = event.selectedTabItemKey;
          selectedContent = itemContentMap[selectedTabItemKey]!;

          if (widget.aniGKey != null && widget.aniGKey!.currentState != null) {
            try {
              widget.aniGKey!.currentState!.reset();
              widget.aniGKey!.currentState!.forward();
            } catch (e) {
              // Absorb
            }
          }
        }

        return FUIAnimationHelper.discernAnimator(
          key: widget.aniGKey,
          fuiAnimationType: widget.contentDisplayAniType ?? FUITabTheme.tabContentAniType,
          preferences: AnimationPreferences(
            duration: widget.contentDisplayAniDuration ?? FUITabTheme.tabContentAniDuration,
            animationStatusListener: (status) {
              if (status == AnimationStatus.completed &&
                  widget.onContentDisplayAniRendered != null) {
                widget.onContentDisplayAniRendered!(selectedTabItemKey);
              }
            },
          ),
          child: Padding(
            padding: FUITabTheme.tabContentViewPadding,
            child: selectedContent,
          ),
        );
      },
    );
  }
}
