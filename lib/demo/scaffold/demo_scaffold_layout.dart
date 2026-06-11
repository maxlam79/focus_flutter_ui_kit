import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../focus_ui_kit/exports.dart';
import '../exports.dart';

class DemoScaffoldLayout extends StatefulWidget {
  final Widget child;

  const DemoScaffoldLayout({
    super.key,
    required this.child,
  });

  @override
  State<DemoScaffoldLayout> createState() => _DemoScaffoldLayoutState();
}

class _DemoScaffoldLayoutState extends State<DemoScaffoldLayout> {
  /// Global Keys
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>(debugLabel: 'scaffold');
  GlobalKey<SliderDrawerState> sliderDrawerKey = GlobalKey<SliderDrawerState>();

  /// Themes
  late FUIThemeCommonColors fuiColors;

  /// Menu
  late FUIExpMenuController menuCtrl;
  late DemoScaffoldMenuLeft demoScaffoldMenuLeft;

  /// Other essential parameters
  final double sliderOpenSize = 300;
  final double topBarHeight = 60;

  @override
  void initState() {
    super.initState();

    _initMenu();
  }

  _initMenu() {
    // Having the menu controller here is important. It retains certain opened menu "state" (because the slider/drawer disposes itself after close).
    menuCtrl = FUIExpMenuController();

    demoScaffoldMenuLeft = DemoScaffoldMenuLeft(
      title: const Text('menu'),
      fuiExpMenu: FUIExpMenu(
        fuiMenuController: menuCtrl,
        fuiMenuItems: _generateMenuItems(),
      ),
      footer: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text('/// Meticulously & Passionately Crafted.'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    fuiColors = context.theme.fuiColors;

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: const PreferredSize(
          preferredSize: Size(0, 0),
          child: SizedBox.shrink(),
        ),
        endDrawer: DemoScaffoldMenuRight(),
        extendBody: true,
        backgroundColor: fuiColors.bg0,
        body: SliderDrawer(
          appBar: const SizedBox.shrink(),
          key: sliderDrawerKey,
          slider: demoScaffoldMenuLeft,
          sliderOpenSize: sliderOpenSize,
          isDraggable: false,
          animationDuration: 100,
          child: Column(
            children: [
              _buildTopBar(),
              Expanded(child: widget.child),
            ],
          ),
        ),
      ),
    );
  }

  List<FUIMenuItem> _generateMenuItems() {
    List<FUIMenuItem> menuItems = [];

    /// Menu Items (Dashboard)
    UniqueKey menuDashboardKey = UniqueKey();

    /// Menu Items (Elements)
    UniqueKey menuElementsKey = UniqueKey();
    UniqueKey subMenuTypographyKey = UniqueKey();
    UniqueKey subMenuColorsKey = UniqueKey();
    UniqueKey subMenuButtonsKey = UniqueKey();
    UniqueKey subMenuPaneAndPanelsKey = UniqueKey();
    UniqueKey subMenuTabsAndAccordionsKey = UniqueKey();
    UniqueKey subMenuNotificationsAndModalsKey = UniqueKey();

    /// Menu Items (Forms)
    UniqueKey menuFormsKey = UniqueKey();
    UniqueKey subMenuInputFieldsKey = UniqueKey();
    UniqueKey subMenuWizardKey = UniqueKey();

    /// Menu Items (Others)
    UniqueKey menuOthersKey = UniqueKey();
    UniqueKey subMenuDataTablesKey = UniqueKey();
    UniqueKey subMenuGraphsAndChartsKey = UniqueKey();
    UniqueKey subMenuCalendarKey = UniqueKey();
    UniqueKey subMenuTimelineKey = UniqueKey();

    /// Menu Items (Widgets)
    UniqueKey menuWidgetsKey = UniqueKey();

    /// Menu Items (Pages)
    UniqueKey menuPagesKey = UniqueKey();
    UniqueKey subMenuLogin01Key = UniqueKey();
    UniqueKey subMenuErrorNotFoundKey = UniqueKey();
    UniqueKey subMenuErrorServiceKey = UniqueKey();

    /// Dashboard
    menuItems.add(
      FUIMenuItem(
        key: menuDashboardKey,
        label: Text('Dashboard'),
        icon: Icon(LineAwesomeIcons.chart_bar),
        selected: true,
        onPressed: () => _goto(DemoPaths.pathDashboard01),
      ),
    );

    /// Elements
    menuItems.add(
      FUIMenuItem(
        key: menuElementsKey,
        label: Text('Basic Elements'),
        icon: Icon(LineAwesomeIcons.stream_solid),
        onPressed: () {},
        fuiSubMenuItems: [
          FUISubMenuItem(
            key: subMenuTypographyKey,
            label: Text('Typography'),
            onPressed: () => _goto(DemoPaths.pathElementsTypography),
          ),
          FUISubMenuItem(
            key: subMenuColorsKey,
            label: Text('Colors'),
            onPressed: () => _goto(DemoPaths.pathElementsColors),
          ),
          FUISubMenuItem(
            key: subMenuButtonsKey,
            label: Text('Buttons'),
            onPressed: () => _goto(DemoPaths.pathElementsButtons),
          ),
          FUISubMenuItem(
            key: subMenuPaneAndPanelsKey,
            label: Text('Panes & Panels'),
            onPressed: () => _goto(DemoPaths.pathElementsPanePanel),
          ),
          FUISubMenuItem(
            key: subMenuTabsAndAccordionsKey,
            label: Text('Tabs & Accordions'),
            onPressed: () => _goto(DemoPaths.pathElementsTabAndAccordion),
          ),
          FUISubMenuItem(
            key: subMenuNotificationsAndModalsKey,
            label: Text('Notifications & Modals'),
            onPressed: () => _goto(DemoPaths.pathElementsNotificationsAndModals),
          ),
        ],
      ),
    );

    /// Forms
    menuItems.add(
      FUIMenuItem(
        key: menuFormsKey,
        label: Text('Forms'),
        icon: Icon(LineAwesomeIcons.edit),
        onPressed: () {},
        fuiSubMenuItems: [
          FUISubMenuItem(
            key: subMenuInputFieldsKey,
            label: Text('Input Fields'),
            onPressed: () => _goto(DemoPaths.pathInputsAndFormsInput),
          ),
          FUISubMenuItem(
            key: subMenuWizardKey,
            label: Text('Forms & Wizards'),
            onPressed: () => _goto(DemoPaths.pathInputsAndFormsFormsAndWizards),
          ),
        ],
      ),
    );

    /// Other Components
    menuItems.add(
      FUIMenuItem(
        key: menuOthersKey,
        label: Text('Other Components'),
        icon: Icon(LineAwesomeIcons.cubes_solid),
        onPressed: () {},
        fuiSubMenuItems: [
          FUISubMenuItem(
            key: subMenuDataTablesKey,
            label: Text('Data Table'),
            onPressed: () => _goto(DemoPaths.pathOthersDataTable),
          ),
          FUISubMenuItem(
            key: subMenuGraphsAndChartsKey,
            label: Text('Graphs & Charts'),
            onPressed: () => _goto(DemoPaths.pathOthersVisualInfo),
          ),
          FUISubMenuItem(
            key: subMenuCalendarKey,
            label: Text('Calendar'),
            onPressed: () => _goto(DemoPaths.pathOthersCalendar),
          ),
          FUISubMenuItem(
            key: subMenuTimelineKey,
            label: Text('Time Line'),
            onPressed: () => _goto(DemoPaths.pathOthersTimeline),
          ),
        ],
      ),
    );

    /// Widgets Catalog
    menuItems.add(
      FUIMenuItem(
        key: menuWidgetsKey,
        label: Text('Widgets Catalog'),
        icon: Icon(LineAwesomeIcons.code_solid),
        onPressed: () => _goto(DemoPaths.pathWidgetCatalog),
      ),
    );

    /// Pages
    menuItems.add(
      FUIMenuItem(
        key: menuPagesKey,
        label: Text('Pages'),
        icon: Icon(LineAwesomeIcons.pager_solid),
        onPressed: () {},
        fuiSubMenuItems: [
          FUISubMenuItem(
            key: subMenuLogin01Key,
            label: Text('Login 01'),
            onPressed: () => _goto(DemoPaths.pathPagesLogin01),
          ),
          FUISubMenuItem(
            key: subMenuErrorNotFoundKey,
            label: Text('Error 404'),
            onPressed: () => _goto(DemoPaths.pathPagesErrorNotFound),
          ),
          FUISubMenuItem(
            key: subMenuErrorServiceKey,
            label: Text('Error 500'),
            onPressed: () => _goto(DemoPaths.pathPagesErrorService),
          ),
        ],
      ),
    );

    return menuItems;
  }

  _buildTopBar() {
    ResponsiveGridCol menuLeft = ResponsiveGridCol(
      xs: 6,
      child: Container(
        height: topBarHeight,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FUIButtonLinkIcon(
              fuiButtonSize: FUIButtonSize.small,
              icon: Icon(Boxicons.bx_menu),
              onPressed: () => _sliderToggle(),
            ),
            FUISpacer.hSpace20,
            _buildLogo(),
          ],
        ),
      ),
    );

    ResponsiveGridCol menuRight = ResponsiveGridCol(
      xs: 6,
      child: Container(
        height: topBarHeight,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FUIButtonLinkIcon(
              fuiButtonSize: FUIButtonSize.small,
              icon: Icon(Boxicons.bx_search),
              onPressed: () => _goto(DemoPaths.pathSearch),
            ),
            FUISpacer.hSpace5,
            FUIButtonLinkIcon(
              fuiButtonSize: FUIButtonSize.small,
              icon: Icon(Boxicons.bx_menu_alt_right),
              onPressed: () => _drawerEndOpen(),
            ),
          ],
        ),
      ),
    );

    return ResponsiveGridRow(
      children: [
        menuLeft,
        menuRight,
      ],
    );
  }

  _buildLogo() {
    double fontSize = 32;
    String fontFamily = FUITypographyTheme.fontFamilyPrimary;

    Text t1 = Text(
      '.',
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: fuiColors.namedRuby,
      ),
    );

    Text t2 = Text(
      'focus',
      style: TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: fuiColors.textHeading,
      ),
    );

    return Row(
      children: [t1, t2],
    );
  }

  _sliderToggle() {
    if (sliderDrawerKey.currentState != null) {
      if (sliderDrawerKey.currentState!.isDrawerOpen) {
        sliderDrawerKey.currentState!.closeSlider();
      } else {
        sliderDrawerKey.currentState!.openSlider();
      }
    }
  }

  _sliderClose() {
    if (sliderDrawerKey.currentState != null && sliderDrawerKey.currentState!.isDrawerOpen) {
      sliderDrawerKey.currentState!.closeSlider();
    }
  }

  _drawerEndOpen() {
    if (scaffoldKey.currentState != null && !scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openEndDrawer();
    }
  }

  _drawerEndClose() {
    if (scaffoldKey.currentState != null && scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.closeEndDrawer();
    }
  }

  _goto(String path) {
    context.go(path);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _sliderClose();
      _drawerEndClose();
    });
  }
}
