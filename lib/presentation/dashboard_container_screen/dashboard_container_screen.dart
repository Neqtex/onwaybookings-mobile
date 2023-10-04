import 'bloc/dashboard_container_bloc.dart';
import 'models/dashboard_container_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/presentation/dashboard_page/dashboard_page.dart';
import 'package:chike_s_application/presentation/message_page/message_page.dart';
import 'package:chike_s_application/presentation/schedule_page/schedule_page.dart';
import 'package:chike_s_application/presentation/settigns_page/settigns_page.dart';
import 'package:chike_s_application/widgets/custom_bottom_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class DashboardContainerScreen extends StatelessWidget {
  DashboardContainerScreen({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardContainerBloc>(
        create: (context) => DashboardContainerBloc(DashboardContainerState(
            dashboardContainerModelObj: DashboardContainerModel()))
          ..add(DashboardContainerInitialEvent()),
        child: DashboardContainerScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<DashboardContainerBloc, DashboardContainerState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              body: Navigator(
                  key: navigatorKey,
                  initialRoute: AppRoutes.dashboardPage,
                  onGenerateRoute: (routeSetting) => PageRouteBuilder(
                      pageBuilder: (ctx, ani, ani1) =>
                          getCurrentPage(context, routeSetting.name!),
                      transitionDuration: Duration(seconds: 0))),
              bottomNavigationBar:
                  CustomBottomBar(onChanged: (BottomBarEnum type) {
                Navigator.pushNamed(
                    navigatorKey.currentContext!, getCurrentRoute(type));
              })));
    });
  }

  ///Handling route based on bottom click actions
  String getCurrentRoute(BottomBarEnum type) {
    switch (type) {
      case BottomBarEnum.Home:
        return AppRoutes.dashboardPage;
      case BottomBarEnum.Messages:
        return AppRoutes.messagePage;
      case BottomBarEnum.Appointment:
        return AppRoutes.schedulePage;
      case BottomBarEnum.Profile:
        return AppRoutes.settignsPage;
      default:
        return "/";
    }
  }

  ///Handling page based on route
  Widget getCurrentPage(
    BuildContext context,
    String currentRoute,
  ) {
    switch (currentRoute) {
      case AppRoutes.dashboardPage:
        return DashboardPage.builder(context);
      case AppRoutes.messagePage:
        return MessagePage.builder(context);
      case AppRoutes.schedulePage:
        return SchedulePage.builder(context);
      case AppRoutes.settignsPage:
        return SettignsPage.builder(context);
      default:
        return DefaultWidget();
    }
  }
}
