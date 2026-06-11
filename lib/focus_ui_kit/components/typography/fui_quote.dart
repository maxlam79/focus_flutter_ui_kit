import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../exports.dart';

class FUIQuoteText extends StatelessWidget with FUIColorMixin {
  final FUIColorScheme fuiColorScheme;
  final Widget? quoteSymbol;
  final Widget textContent;
  final Widget? bottomLine1;
  final Widget? bottomLine2;

  FUIQuoteText({
    Key? key,
    this.fuiColorScheme = FUIColorScheme.primary,
    this.quoteSymbol,
    required this.textContent,
    this.bottomLine1,
    this.bottomLine2,
  }) : super(key: key ?? UniqueKey());

  @override
  Widget build(BuildContext context) {
    FUIThemeCommonColors fuiColors = context.theme.fuiColors;
    FUIQuoteTheme quoteTheme = context.theme.fuiQuote;
    List<Widget> buildList = [];

    /// BIG "

    if (quoteSymbol != null) {
      buildList.add(quoteSymbol!);
    } else {
      buildList.add(
        SvgPicture.asset(
          'assets/svg/double-quote-round.svg',
          width: FUIQuoteTheme.fontSizeQuote,
          height: FUIQuoteTheme.fontSizeQuote,
          colorFilter: ColorFilter.mode(fuiColors.shade3, BlendMode.srcIn),
        ),
      );
    }

    buildList.add(FUISpacer.vSpace7);

    /// Main Content
    buildList.add(
      IconTheme.merge(
        data: IconThemeData(
          color: quoteTheme.quoteContent.color,
          size: quoteTheme.quoteContent.fontSize,
        ),
        child: DefaultTextStyle(
          style: quoteTheme.quoteContent,
          child: textContent,
        ),
      ),
    );

    /// Bottom Line 1
    if (bottomLine1 != null) {
      buildList.add(FUISpacer.vSpace7);
      buildList.add(
        IconTheme.merge(
          data: IconThemeData(
            color: quoteTheme.quoteBottomLine1.color,
            size: quoteTheme.quoteBottomLine1.fontSize,
          ),
          child: DefaultTextStyle(
            style: quoteTheme.quoteBottomLine1,
            child: bottomLine1!,
          ),
        ),
      );
    }

    /// Bottom Line 2
    if (bottomLine2 != null) {
      buildList.add(FUISpacer.vSpace2);
      buildList.add(
        IconTheme.merge(
          data: IconThemeData(
            color: quoteTheme.quoteBottomLine2.color,
            size: quoteTheme.quoteBottomLine2.fontSize,
          ),
          child: DefaultTextStyle(
            style: quoteTheme.quoteBottomLine2,
            child: bottomLine2!,
          ),
        ),
      );
    }

    return Container(
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: discernColorByScheme(context, fuiColorScheme: fuiColorScheme),
            width: 8,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
        child: FUIColumn(
          children: buildList,
        ),
      ),
    );
  }
}
