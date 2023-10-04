import 'bloc/app_navigation_bloc.dart';
import 'models/app_navigation_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends StatelessWidget {
  const AppNavigationScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<AppNavigationBloc>(
        create: (context) => AppNavigationBloc(
            AppNavigationState(appNavigationModelObj: AppNavigationModel()))
          ..add(AppNavigationInitialEvent()),
        child: AppNavigationScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<AppNavigationBloc, AppNavigationState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              body: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            decoration: AppDecoration.fillPrimary,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: getPadding(
                                              left: 20,
                                              top: 10,
                                              right: 20,
                                              bottom: 10),
                                          child: Text("lbl_app_navigation".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: appTheme.black900,
                                                  fontSize: getFontSize(20),
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.w400)))),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                          padding: getPadding(left: 20),
                                          child: Text("msg_check_your_app_s".tr,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: appTheme.blueGray400,
                                                  fontSize: getFontSize(16),
                                                  fontFamily: 'Roboto',
                                                  fontWeight:
                                                      FontWeight.w400)))),
                                  Padding(
                                      padding: getPadding(top: 5),
                                      child: Divider(
                                          height: getVerticalSize(1),
                                          thickness: getVerticalSize(1),
                                          color: appTheme.black900))
                                ])),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Container(
                                    decoration: AppDecoration.fillPrimary,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                onTapSplashScreen(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_splash_screen"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapLogin(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_login"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapSignup(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_signup2"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapDashboardContainer(
                                                    context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "msg_dashboard_container"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapDrList(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_dr_list"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapDrDetails(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_dr_details"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapBookanappointment(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "msg_book_an_appointment"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapChat(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_chat"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapPharmacy(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_pharmacy"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapDrugDetails(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_drug_details"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapArticle(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_article"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapCart(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_cart"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ]))),
                                          GestureDetector(
                                              onTap: () {
                                                onTapAmbulance(context);
                                              },
                                              child: Container(
                                                  decoration:
                                                      AppDecoration.fillPrimary,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            20,
                                                                        top: 10,
                                                                        right:
                                                                            20,
                                                                        bottom:
                                                                            10),
                                                                child: Text(
                                                                    "lbl_ambulance2"
                                                                        .tr,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color:
                                                                            appTheme
                                                                                .black900,
                                                                        fontSize:
                                                                            getFontSize(
                                                                                20),
                                                                        fontFamily:
                                                                            'Roboto',
                                                                        fontWeight:
                                                                            FontWeight.w400)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 5),
                                                            child: Divider(
                                                                height:
                                                                    getVerticalSize(
                                                                        1),
                                                                thickness:
                                                                    getVerticalSize(
                                                                        1),
                                                                color: appTheme
                                                                    .blueGray400))
                                                      ])))
                                        ]))))
                      ]))));
    });
  }

  /// Navigates to the splashScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the splashScreen.
  onTapSplashScreen(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.splashScreen,
    );
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapSignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the dashboardContainerScreen.
  onTapDashboardContainer(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Navigates to the drListScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drListScreen.
  onTapDrList(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drListScreen,
    );
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drDetailsScreen.
  onTapDrDetails(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drDetailsScreen,
    );
  }

  /// Navigates to the bookAnAppointmentScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the bookAnAppointmentScreen.
  onTapBookanappointment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bookAnAppointmentScreen,
    );
  }

  /// Navigates to the chatScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the chatScreen.
  onTapChat(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }

  /// Navigates to the pharmacyScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the pharmacyScreen.
  onTapPharmacy(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.pharmacyScreen,
    );
  }

  /// Navigates to the drugDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drugDetailsScreen.
  onTapDrugDetails(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drugDetailsScreen,
    );
  }

  /// Navigates to the articleScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the articleScreen.
  onTapArticle(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.articleScreen,
    );
  }

  /// Navigates to the cartScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cartScreen.
  onTapCart(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cartScreen,
    );
  }

  /// Navigates to the ambulanceScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the ambulanceScreen.
  onTapAmbulance(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.ambulanceScreen,
    );
  }
}
