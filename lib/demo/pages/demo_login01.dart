import 'package:color_shade/color_shade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:octo_image/octo_image.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../focus_ui_kit/exports.dart';
import '../exports.dart';

class DemoLogin01 extends StatefulWidget {
  const DemoLogin01({super.key});

  @override
  State<DemoLogin01> createState() => _DemoLogin01State();
}

class _DemoLogin01State extends State<DemoLogin01> {
  /// Global Keys
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'login01');

  /// Theme
  late FUIThemeCommonColors fuiColors;
  late FUITypographyTheme typoTheme;

  /// Bloc Controllers
  late FUIPaneController paneCtrl;

  /// Attributes & Flags
  final String blurHash =
      '|15q|s-;9FRjofRjIU%MRj~qfQRjj[RjWBj[xuRj%Mt7M{j[ayofoffQt7xuj[ofj[ayM{t7WBRjWBWBofofWBt7t7WBRj%MofWBWBayofRjRjxu-;ofxuRjj[ayRjofWBxuofRjayRjRjRjt7oft7WBM{ofayfQayoft7';
  final String backgroundImgPath = 'assets/demo-background/bglogin01.jpg';
  late double screenHeight;

  @override
  void initState() {
    super.initState();

    _initBloc();
  }

  _initBloc() {
    paneCtrl = FUIPaneController();
  }

  @override
  void dispose() {
    if (scaffoldKey.currentState != null) {
      scaffoldKey.currentState!.dispose();
    }

    paneCtrl.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;
    typoTheme = context.theme.fuiTypography;

    screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: scaffoldKey,
      extendBody: true,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topLeft,
        clipBehavior: Clip.antiAlias,
        children: [
          _buildBlurHashImage(blurHash, AssetImage(backgroundImgPath)),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 0,
                sm: 0,
                md: 6,
                child: _section_Logo(),
              ),
              ResponsiveGridCol(
                xs: 12,
                sm: 12,
                md: 6,
                child: _section_Login(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildBlurHashImage(String hash, ImageProvider imgProvider) {
    return OctoImage.fromSet(
      fit: BoxFit.cover,
      image: imgProvider,
      octoSet: OctoSet(
        placeholderBuilder: (context) {
          return SizedBox.expand(
            child: Image(
              fit: BoxFit.cover,
              image: BlurHashImage(hash),
            ),
          );
        },
      ),
    );
  }

  _section_Logo() {
    TextStyle tsDot = typoTheme.h1.copyWith(color: fuiColors.primary);
    TextStyle tsTitle = typoTheme.h1.copyWith(color: fuiColors.shade0);

    return SizedBox(
      height: screenHeight,
      child: Container(
        padding: const EdgeInsets.only(right: 50, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.bottomRight,
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: '.',
                      style: tsDot,
                    ),
                    TextSpan(
                      text: 'authentication',
                      style: tsTitle,
                    ),
                  ],
                ),
              ),
            ),
            Align(
                alignment: Alignment.topRight,
                child: SmallText(Text('.focus - a UX/UI theme built for Flutter.',
                    style: TextStyle(color: fuiColors.shade2.shade500)))),
          ],
        ),
      ),
    );
  }

  _section_Login() {
    return FUIPane(
      paneController: paneCtrl,
      paceBarRepeating: true,
      decoration: BoxDecoration(color: fuiColors.shade0),
      height: screenHeight,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FUISingleChildScrollView(
                child: _buildLogin(context),
              ),
            ),
            Visibility(
              visible: responsiveValue(context, md: true, sm: false, xs: false),
              child: _buildBottomLinks(),
            ),
          ],
        ),
      ),
    );
  }

  _buildLogin(BuildContext context) {
    return Container(
      width: FUIInputTheme.minWidth,
      padding: EdgeInsets.only(
        top: responsiveValue(
          context,
          md: 200,
          sm: 50,
          xs: 50,
        ),
      ),
      child: FUIColumn(
        children: [
          H2(const Text('Welcome')),
          FUISpacer.vSpace20,
          Regular(const Text('Please enter your credential.')),
          FUISpacer.vSpace20,
          FUIInputText(
            label: 'Username / email',
          ),
          FUISpacer.vSpace10,
          FUIInputText(
            label: 'Password',
            obscureText: true,
          ),
          FUISpacer.vSpace5,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FUIButtonLinkTextIcon(text: const Text('Forgot password?'), onPressed: () {}),
            ],
          ),
          FUISpacer.vSpace20,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FUIButtonBlockTextIcon(text: const Text('Login'), onPressed: () => _loginProcess()),
            ],
          ),
          FUISpacer.vSpace30,
          FUIHDivider(),
          FUISpacer.vSpace30,
          SmallText(Text('or authenticate via social media')),
          FUISpacer.vSpace30,
          Center(
            child: Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 10,
              children: [
                FUITooltip(
                  tooltip: const Text('Apple'),
                  child: FUIButtonBlockCircleIcon(
                    icon: const Icon(
                      LineAwesomeIcons.apple,
                      color: Colors.white,
                    ),
                    backgroundColor: fuiColors.secondary,
                    onPressed: () => _loginProcess(),
                  ),
                ),
                FUITooltip(
                  tooltip: const Text('Google'),
                  child: FUIButtonBlockCircleIcon(
                    icon: const Icon(
                      LineAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xffDB4437),
                    onPressed: () => _loginProcess(),
                  ),
                ),
                FUITooltip(
                  tooltip: const Text('Facebook'),
                  child: FUIButtonBlockCircleIcon(
                    icon: const Icon(
                      LineAwesomeIcons.facebook,
                      color: Colors.white,
                    ),
                    backgroundColor: const Color(0xff3d5b96),
                    onPressed: () => _loginProcess(),
                  ),
                ),
                FUITooltip(
                  tooltip: const Text('Github'),
                  child: FUIButtonBlockCircleIcon(
                    icon: const Icon(
                      LineAwesomeIcons.github,
                      color: Colors.white,
                    ),
                    backgroundColor: fuiColors.secondary,
                    onPressed: () => _loginProcess(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomLinks() {
    return Container(
      padding: const EdgeInsets.only(right: 20, bottom: 20),
      child: Wrap(
        spacing: 30,
        runSpacing: 20,
        children: [
          FUIButtonLinkTextIcon(text: const Text('About Us'), onPressed: () {}),
          FUIButtonLinkTextIcon(text: const Text('Privacy Policy'), onPressed: () {}),
          FUIButtonLinkTextIcon(text: const Text('Terms of Service'), onPressed: () {}),
        ],
      ),
    );
  }

  _loginProcess() {
    paneCtrl.trigger(const FUIPaneControlEvent(
      enable: false,
      blur: true,
      paceBarShow: true,
    ));

    Future.delayed(const Duration(seconds: 2), () {
      paneCtrl.trigger(const FUIPaneControlEvent(
        enable: true,
        blur: false,
        paceBarShow: false,
      ));

      context.go(DemoPaths.pathDashboard01);
    });
  }
}
