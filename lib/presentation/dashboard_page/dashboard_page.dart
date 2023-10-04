import '../dashboard_page/widgets/dashboard_item_widget.dart';
import 'bloc/dashboard_bloc.dart';
import 'models/dashboard_item_model.dart';
import 'models/dashboard_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_title.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_icon_button.dart';
import 'package:chike_s_application/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DashboardBloc>(
        create: (context) =>
            DashboardBloc(DashboardState(dashboardModelObj: DashboardModel()))
              ..add(DashboardInitialEvent()),
        child: DashboardPage());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                height: getVerticalSize(126),
                title: AppbarTitle(
                    text: "msg_find_your_desire".tr,
                    margin: getMargin(left: 20)),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgNotificationicon,
                      margin:
                          getMargin(left: 20, top: 16, right: 20, bottom: 19))
                ]),
            body: SizedBox(
                width: mediaQueryData.size.width,
                child: SingleChildScrollView(
                    padding: getPadding(top: 20),
                    child: Padding(
                        padding: getPadding(left: 20, bottom: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              BlocSelector<DashboardBloc, DashboardState,
                                      TextEditingController?>(
                                  selector: (state) => state.searchController,
                                  builder: (context, searchController) {
                                    return CustomSearchView(
                                        margin: getMargin(right: 20),
                                        controller: searchController,
                                        hintText: "msg_search_doctor_drugs".tr,
                                        hintStyle: theme.textTheme.bodySmall!,
                                        prefix: Container(
                                            margin: getMargin(
                                                left: 17,
                                                top: 10,
                                                right: 12,
                                                bottom: 9),
                                            child: CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgSearch)),
                                        prefixConstraints: BoxConstraints(
                                            maxHeight: getVerticalSize(40)),
                                        suffix: Padding(
                                            padding: EdgeInsets.only(
                                                right: getHorizontalSize(15)),
                                            child: IconButton(
                                                onPressed: () {
                                                  searchController!.clear();
                                                },
                                                icon: Icon(Icons.clear,
                                                    color: Colors
                                                        .grey.shade600))));
                                  }),
                              Padding(
                                  padding: getPadding(top: 20, right: 20),
                                  child: Row(children: [
                                    CustomIconButton(
                                        height: getSize(71),
                                        width: getSize(71),
                                        padding: getPadding(all: 16),
                                        decoration:
                                            IconButtonStyleHelper.fillCyan,
                                        onTap: () {
                                          onTapBtnUserone(context);
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgUserPrimary)),
                                    CustomIconButton(
                                        height: getSize(71),
                                        width: getSize(71),
                                        margin: getMargin(left: 17),
                                        padding: getPadding(all: 14),
                                        decoration:
                                            IconButtonStyleHelper.fillCyan,
                                        onTap: () {
                                          onTapBtnCalculatorone(context);
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgCalculator)),
                                    CustomIconButton(
                                        height: getSize(71),
                                        width: getSize(71),
                                        margin: getMargin(left: 17),
                                        padding: getPadding(all: 15),
                                        decoration:
                                            IconButtonStyleHelper.fillCyan,
                                        onTap: () {
                                          onTapBtnAmbulanceone(context);
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgAmbulance)),
                                    CustomIconButton(
                                        height: getSize(71),
                                        width: getSize(71),
                                        margin: getMargin(left: 17),
                                        padding: getPadding(all: 18),
                                        decoration:
                                            IconButtonStyleHelper.fillCyan,
                                        onTap: () {
                                          onTapBtnArticalsicon(context);
                                        },
                                        child: CustomImageView(
                                            svgPath:
                                                ImageConstant.imgArticalsicon))
                                  ])),
                              Container(
                                  width: getHorizontalSize(335),
                                  margin: getMargin(top: 20, right: 20),
                                  padding: getPadding(
                                      left: 25, top: 11, right: 25, bottom: 11),
                                  decoration: AppDecoration.fillBlueGray
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder10),
                                  child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: getHorizontalSize(186),
                                            margin: getMargin(left: 1, top: 3),
                                            child: Text(
                                                "msg_early_protection".tr,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: theme
                                                    .textTheme.titleLarge!
                                                    .copyWith(height: 1.25))),
                                        CustomElevatedButton(
                                            height: getVerticalSize(29),
                                            width: getHorizontalSize(108),
                                            text: "lbl_learn_more".tr,
                                            margin: getMargin(top: 6),
                                            buttonTextStyle: CustomTextStyles
                                                .labelLargePrimary)
                                      ])),
                              Padding(
                                  padding: getPadding(top: 39, right: 20),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_top_doctor".tr,
                                            style: theme.textTheme.titleMedium),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtSeeall(context);
                                            },
                                            child: Padding(
                                                padding: getPadding(bottom: 3),
                                                child: Text("lbl_see_all".tr,
                                                    style: CustomTextStyles
                                                        .bodySmallCyan300)))
                                      ])),
                              SizedBox(
                                  height: getVerticalSize(186),
                                  child: BlocSelector<DashboardBloc,
                                          DashboardState, DashboardModel?>(
                                      selector: (state) =>
                                          state.dashboardModelObj,
                                      builder: (context, dashboardModelObj) {
                                        return ListView.separated(
                                            padding: getPadding(top: 13),
                                            scrollDirection: Axis.horizontal,
                                            separatorBuilder: (context, index) {
                                              return SizedBox(
                                                  width: getHorizontalSize(14));
                                            },
                                            itemCount: dashboardModelObj
                                                    ?.dashboardItemList
                                                    .length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              DashboardItemModel model =
                                                  dashboardModelObj
                                                              ?.dashboardItemList[
                                                          index] ??
                                                      DashboardItemModel();
                                              return DashboardItemWidget(model,
                                                  onTapDoctor: () {
                                                onTapDoctor(context);
                                              });
                                            });
                                      })),
                              Padding(
                                  padding: getPadding(top: 28, right: 23),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("lbl_healt_article".tr,
                                            style: theme.textTheme.titleMedium),
                                        GestureDetector(
                                            onTap: () {
                                              onTapTxtSeeallone(context);
                                            },
                                            child: Padding(
                                                padding: getPadding(top: 3),
                                                child: Text("lbl_see_all".tr,
                                                    style: CustomTextStyles
                                                        .bodySmallCyan300)))
                                      ])),
                              Container(
                                  margin: getMargin(top: 15, right: 20),
                                  padding: getPadding(all: 6),
                                  decoration: AppDecoration.outlineBluegray50
                                      .copyWith(
                                          borderRadius: BorderRadiusStyle
                                              .roundedBorder10),
                                  child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        CustomImageView(
                                            imagePath:
                                                ImageConstant.imgThumbnail,
                                            height: getSize(55),
                                            width: getSize(55)),
                                        Padding(
                                            padding: getPadding(
                                                left: 12, top: 7, bottom: 7),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      width: getHorizontalSize(
                                                          179),
                                                      child: Text(
                                                          "msg_the_25_healthiest"
                                                              .tr,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: CustomTextStyles
                                                              .labelMediumPrimaryContainer)),
                                                  Padding(
                                                      padding:
                                                          getPadding(top: 2),
                                                      child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                                "lbl_jun_10_2021"
                                                                    .tr,
                                                                style: theme
                                                                    .textTheme
                                                                    .labelSmall),
                                                            Container(
                                                                height:
                                                                    getSize(2),
                                                                width:
                                                                    getSize(2),
                                                                margin:
                                                                    getMargin(
                                                                        left: 5,
                                                                        top: 3,
                                                                        bottom:
                                                                            4),
                                                                decoration: BoxDecoration(
                                                                    color: theme
                                                                        .colorScheme
                                                                        .errorContainer,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            getHorizontalSize(1)))),
                                                            Padding(
                                                                padding:
                                                                    getPadding(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                    "lbl_5min_read"
                                                                        .tr,
                                                                    style: theme
                                                                        .textTheme
                                                                        .labelSmall))
                                                          ]))
                                                ]))
                                      ]))
                            ]))))));
  }

  /// Navigates to the drListScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drListScreen.
  onTapBtnUserone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.drListScreen);
  }

  /// Navigates to the pharmacyScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the pharmacyScreen.
  onTapBtnCalculatorone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.pharmacyScreen);
  }

  /// Navigates to the ambulanceScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the ambulanceScreen.
  onTapBtnAmbulanceone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.ambulanceScreen);
  }

  /// Navigates to the articleScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the articleScreen.
  onTapBtnArticalsicon(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.articleScreen);
  }

  /// Navigates to the drListScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drListScreen.
  onTapTxtSeeall(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.drListScreen);
  }

  /// Navigates to the articleScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the articleScreen.
  onTapTxtSeeallone(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.articleScreen);
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drDetailsScreen.
  onTapDoctor(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drDetailsScreen,
    );
  }
}
