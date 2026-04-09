import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../exports.dart';

class FUIFileUploadDropbox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final bool borderDashPatternShow;
  final Color? borderDashColor;
  final List<double>? borderDashPattern;

  FUIFileUploadDropbox({
    Key? key,
    this.width,
    this.height,
    this.child,
    this.borderDashPatternShow = true,
    this.borderDashColor,
    this.borderDashPattern,
  }) : super(key: key ?? UniqueKey());

  @override
  Widget build(BuildContext context) {
    FUIFileUploadTheme uploadTheme = context.theme.fuiFileUpload;

    return borderDashPatternShow
        ? DottedBorder(
            options: RoundedRectDottedBorderOptions(
              color: borderDashColor ?? uploadTheme.dropboxBorderColor,
              dashPattern: FUIFileUploadTheme.dropboxDashPattern,
              radius: const Radius.circular(FUIFileUploadTheme.dropboxBorderRadius),
            ),
            child: _buildCenterContent(),
          )
        : _buildCenterContent();
  }

  _buildCenterContent() {
    if (child != null) {
      return child!;
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(FUIFileUploadTheme.dropboxUploadIcon),
            FUISpacer.vSpace10,
            Padding(
              padding: FUIFileUploadTheme.dropboxUploadTextPadding,
              child: Align(
                alignment: Alignment.center,
                child: Regular(
                  const Text(FUIFileUploadTheme.dropboxUploadText),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
