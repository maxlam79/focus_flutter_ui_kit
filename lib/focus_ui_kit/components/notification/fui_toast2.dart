import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:oktoast/oktoast.dart';

import '../../exports.dart';

class FUIToast2 with FUIToastMixin, FUIColorMixin {
  final BuildContext context;

  FUIToast2(this.context);

  show({
    required String msg,
    FUIColorScheme? fuiColorScheme,
    FUIToastPosition? fuiToastPosition,
    TextStyle? textStyle,
    EdgeInsets textPadding = FUIToastTheme.toast12TextPadding,
    IconData? sideIcon,
    double sideIconSize = FUIToastTheme.toast12FontSize,
    FUIToastIconPosition? fuiToastIconPosition = FUIToastIconPosition.left,
    EdgeInsets sideIconPadding = FUIToastTheme.toast12SideIconPadding,
    IconData closeIcon = LineAwesomeIcons.times_solid,
    EdgeInsets closeIconPadding = FUIToastTheme.toast12CloseIconPadding,
    Color? backgroundColor,
    Duration? duration,
    Duration? animationDuration,
    double? radius,
    VoidCallback? onTap,
    VoidCallback? onDismiss,
    bool showCloseButton = true,
  }) {
    List<Widget> widgets = [];
    Widget? sideIconWidget;
    Widget? closeButtonWidget;
    ToastFuture? toastFuture;

    Color color = discernColorByScheme(context, fuiColorScheme: fuiColorScheme);
    TextStyle ts = discernTextStyle(context, fuiToastColorScheme: fuiColorScheme);

    Widget textContent = Container(
      margin: EdgeInsets.zero,
      padding: textPadding,
      child: Text(msg, style: textStyle ?? ts),
    );

    if (sideIcon != null) {
      sideIconWidget = Container(
        margin: EdgeInsets.zero,
        padding: sideIconPadding,
        child: Icon(sideIcon, size: sideIconSize, color: textStyle?.color ?? ts.color),
      );
    }

    if (sideIconWidget != null) {
      switch (fuiToastIconPosition) {
        case FUIToastIconPosition.right:
          widgets.add(textContent);
          widgets.add(sideIconWidget);
          break;
        case FUIToastIconPosition.left:
        default:
          widgets.add(sideIconWidget);
          widgets.add(textContent);
          break;
      }
    } else {
      widgets.add(textContent);
    }

    if (showCloseButton) {
      closeButtonWidget = MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {
            if (toastFuture != null) {
              try {
                toastFuture.dismiss(showAnim: true);
              } catch (e) {
                /// Absorb
              }
            }
          },
          child: Container(
            margin: EdgeInsets.zero,
            padding: closeIconPadding,
            child: Icon(
              closeIcon,
              size: FUIToastTheme.toast12FontSize,
              color: textStyle?.color ?? ts.color,
            ),
          ),
        ),
      );

      widgets.add(closeButtonWidget);
    }

    Widget toastContainer = GestureDetector(
      onTap: onTap,
      child: Container(
        padding: FUIToastTheme.toast12ContainerPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FUIToastTheme.toast12Radius),
          color: backgroundColor ?? color.withValues(alpha: FUIToastTheme.toast12BackgroundOpacity),
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: widgets,
          ),
        ),
      ),
    );

    toastFuture = showToastWidget(
      toastContainer,
      context: context,
      handleTouch: true,
      position: fuiToastPosition ?? FUIToastPosition.top,
      duration: duration ?? FUIToastTheme.toast12Duration,
      animationDuration: animationDuration ?? FUIToastTheme.toast12AnimationDuration,
      onDismiss: onDismiss,
    );

    return toastFuture;
  }
}
