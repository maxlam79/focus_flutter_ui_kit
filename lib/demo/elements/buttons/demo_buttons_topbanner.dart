import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../../focus_ui_kit/exports.dart';
import '../../exports.dart';

class DemoButtonsTopBanner extends StatelessWidget {
  final String bgImg = 'bg07';

  const DemoButtonsTopBanner({super.key});

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUITypographyTheme typoTheme = context.theme.fuiTypography;

    TextStyle tsDot = typoTheme.h1.copyWith(color: fuiColors.primary);
    TextStyle tsTitle = typoTheme.h1.copyWith(color: fuiColors.shade0);

    double bannerHeight = responsiveValue(context, md: 310, sm: 340, xs: 340);

    return FUISectionParallax(
      height: bannerHeight,
      backgroundColor: fuiColors.secondary,
      imgProvider: DemoHelper.bgImgProviderMap[bgImg]!,
      blurHash: DemoHelper.bgImgBlurHashMap[bgImg],
      child: Stack(
        children: [
          DemoHelper.buildGradientBox(),
          Padding(
            padding: FUISectionTheme.eiSecContainerPaddingAll,
            child: ResponsiveGridRow(
              children: [
                // Spacer
                ResponsiveGridCol(
                  lg: 7,
                  md: 5,
                  sm: 0,
                  child: const SizedBox.shrink(),
                ),
                ResponsiveGridCol(
                  lg: 5,
                  md: 7,
                  sm: 12,
                  child: FUISectionContainer(
                    child: FUIColumn(
                      children: [
                        FUISpacer.vSpace15,
                        PreH(Text('THE BASIC ELEMENT FOR EXECUTION', style: TextStyle(color: fuiColors.shade0))),
                        Container(
                          alignment: Alignment.bottomLeft,
                          padding: FUITypographyTheme.fontPaddingH1,
                          child: Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                text: '.',
                                style: tsDot,
                              ),
                              TextSpan(
                                text: 'buttons',
                                style: tsTitle,
                              ),
                            ]),
                          ),
                        ),
                        Regular(Text('Multiple buttons for different use cases.', style: TextStyle(color: fuiColors.shade0))),
                        SmallText(Text('Built for web developers who are migrating to Flutter in mind.', style: TextStyle(color: fuiColors.shade0))),
                        FUISpacer.vSpace10,
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
