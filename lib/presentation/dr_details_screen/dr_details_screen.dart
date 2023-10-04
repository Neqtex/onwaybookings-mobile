import '../dr_details_screen/widgets/timeslots_item_widget.dart';
import 'bloc/dr_details_bloc.dart';
import 'models/dr_details_model.dart';
import 'models/timeslots_item_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_floating_text_field.dart';
import 'package:chike_s_application/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DrDetailsScreen extends StatelessWidget {
  const DrDetailsScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DrDetailsBloc>(
        create: (context) =>
            DrDetailsBloc(DrDetailsState(drDetailsModelObj: DrDetailsModel()))
              ..add(DrDetailsInitialEvent()),
        child: DrDetailsScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: theme.colorScheme.primary,
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: getHorizontalSize(45),
                leading: AppbarImage1(
                    svgPath: ImageConstant.imgArrowleft,
                    margin: getMargin(left: 21, top: 16, bottom: 16),
                    onTap: () {
                      onTapArrowleftone(context);
                    }),
                centerTitle: true,
                title: AppbarSubtitle(text: "lbl_doctor_detail".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgComponent1,
                      margin: getMargin(all: 20))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 24, bottom: 24),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: getMargin(left: 20, right: 20),
                          padding: getPadding(
                              left: 10, top: 6, right: 10, bottom: 6),
                          decoration: AppDecoration.outlineBluegray50.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Row(mainAxisSize: MainAxisSize.max, children: [
                            CustomImageView(
                                imagePath: ImageConstant.imgThumbnail1,
                                height: getSize(111),
                                width: getSize(111),
                                margin: getMargin(top: 4)),
                            Padding(
                                padding:
                                    getPadding(left: 17, top: 8, bottom: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text("msg_dr_marcus_horizon".tr,
                                          style:
                                              CustomTextStyles.titleMedium18),
                                      Padding(
                                          padding: getPadding(top: 5),
                                          child: Text("lbl_chardiologist".tr,
                                              style:
                                                  theme.textTheme.labelLarge)),
                                      Padding(
                                          padding: getPadding(left: 3, top: 16),
                                          child: Row(children: [
                                            CustomImageView(
                                                svgPath: ImageConstant.imgStar,
                                                height: getSize(13),
                                                width: getSize(13),
                                                margin: getMargin(bottom: 2)),
                                            Padding(
                                                padding: getPadding(left: 4),
                                                child: Text("lbl_4_7".tr,
                                                    style: CustomTextStyles
                                                        .labelLargeCyan300))
                                          ])),
                                      Padding(
                                          padding: getPadding(top: 8),
                                          child: Row(children: [
                                            CustomImageView(
                                                svgPath:
                                                    ImageConstant.imgLocation,
                                                height: getSize(13),
                                                width: getSize(13),
                                                margin: getMargin(bottom: 2)),
                                            Padding(
                                                padding: getPadding(left: 3),
                                                child: Text("lbl_800m_away".tr,
                                                    style: theme
                                                        .textTheme.labelLarge))
                                          ]))
                                    ]))
                          ])),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: getPadding(left: 21, top: 23),
                              child: Text("lbl_about".tr,
                                  style: theme.textTheme.titleMedium))),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                              width: getHorizontalSize(313),
                              margin: getMargin(left: 21, top: 11),
                              child: ReadMoreText("msg_lorem_ipsum_dolor".tr,
                                  trimLines: 3,
                                  colorClickableText: appTheme.cyan300,
                                  trimMode: TrimMode.Line,
                                  trimCollapsedText: "lbl_read_more".tr,
                                  moreStyle: theme.textTheme.bodySmall!
                                      .copyWith(height: 1.67),
                                  lessStyle: theme.textTheme.bodySmall!
                                      .copyWith(height: 1.67)))),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 24, top: 33),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    BlocSelector<DrDetailsBloc, DrDetailsState,
                                            TextEditingController?>(
                                        selector: (state) =>
                                            state.dateController,
                                        builder: (context, dateController) {
                                          return CustomFloatingTextField(
                                              width: getHorizontalSize(46),
                                              controller: dateController,
                                              labelText: "lbl_mon".tr,
                                              labelStyle: CustomTextStyles
                                                  .titleMedium18,
                                              hintText: "lbl_mon".tr,
                                              hintStyle: CustomTextStyles
                                                  .titleMedium18);
                                        }),
                                    Container(
                                        margin: getMargin(left: 12),
                                        padding: getPadding(
                                            left: 11,
                                            top: 13,
                                            right: 11,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 2),
                                                  child: Text("lbl_tue".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall10)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text("lbl_22".tr,
                                                      style: CustomTextStyles
                                                          .titleMedium18))
                                            ])),
                                    BlocSelector<DrDetailsBloc, DrDetailsState,
                                            TextEditingController?>(
                                        selector: (state) =>
                                            state.datetwoController,
                                        builder: (context, datetwoController) {
                                          return CustomFloatingTextField(
                                              width: getHorizontalSize(46),
                                              margin: getMargin(left: 12),
                                              controller: datetwoController,
                                              labelText: "lbl_wed".tr,
                                              labelStyle: CustomTextStyles
                                                  .titleMediumPrimary,
                                              hintText: "lbl_wed".tr,
                                              hintStyle: CustomTextStyles
                                                  .titleMediumPrimary,
                                              textInputAction:
                                                  TextInputAction.done,
                                              borderDecoration:
                                                  FloatingTextFormFieldStyleHelper
                                                      .fillCyan,
                                              fillColor: appTheme.cyan300);
                                        }),
                                    Container(
                                        margin: getMargin(left: 12),
                                        padding: getPadding(
                                            left: 11,
                                            top: 13,
                                            right: 11,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 2),
                                                  child: Text("lbl_thu".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall10)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text("lbl_24".tr,
                                                      style: CustomTextStyles
                                                          .titleMedium18))
                                            ])),
                                    Container(
                                        margin: getMargin(left: 12),
                                        padding: getPadding(
                                            left: 11,
                                            top: 13,
                                            right: 11,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 5),
                                                  child: Text("lbl_fri".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall10)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text("lbl_25".tr,
                                                      style: CustomTextStyles
                                                          .titleMedium18))
                                            ])),
                                    Container(
                                        margin: getMargin(left: 12),
                                        padding: getPadding(
                                            left: 11,
                                            top: 13,
                                            right: 11,
                                            bottom: 13),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 3),
                                                  child: Text("lbl_sat".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall10)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text("lbl_26".tr,
                                                      style: CustomTextStyles
                                                          .titleMedium18))
                                            ])),
                                    Container(
                                        margin: getMargin(left: 12),
                                        padding: getPadding(
                                            left: 11,
                                            top: 14,
                                            right: 11,
                                            bottom: 14),
                                        decoration: AppDecoration
                                            .outlineBlueGray
                                            .copyWith(
                                                borderRadius: BorderRadiusStyle
                                                    .roundedBorder10),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding: getPadding(left: 3),
                                                  child: Text("lbl_sat".tr,
                                                      style: CustomTextStyles
                                                          .bodySmall10)),
                                              Padding(
                                                  padding: getPadding(top: 2),
                                                  child: Text("lbl_26".tr,
                                                      style: CustomTextStyles
                                                          .titleMedium18))
                                            ]))
                                  ])))),
                      Padding(
                          padding: getPadding(top: 38),
                          child: Divider(
                              indent: getHorizontalSize(20),
                              endIndent: getHorizontalSize(20))),
                      Padding(
                          padding: getPadding(top: 37, bottom: 5),
                          child: BlocSelector<DrDetailsBloc, DrDetailsState,
                                  DrDetailsModel?>(
                              selector: (state) => state.drDetailsModelObj,
                              builder: (context, drDetailsModelObj) {
                                return Wrap(
                                    runSpacing: getVerticalSize(13),
                                    spacing: getHorizontalSize(13),
                                    children: List<Widget>.generate(
                                        drDetailsModelObj
                                                ?.timeslotsItemList.length ??
                                            0, (index) {
                                      TimeslotsItemModel model =
                                          drDetailsModelObj
                                                  ?.timeslotsItemList[index] ??
                                              TimeslotsItemModel();
                                      return TimeslotsItemWidget(model,
                                          onSelectedChipView: (value) {
                                        context.read<DrDetailsBloc>().add(
                                            UpdateChipViewEvent(
                                                index: index,
                                                isSelected: value));
                                      });
                                    }));
                              }))
                    ])),
            bottomNavigationBar: Padding(
                padding: getPadding(left: 20, right: 20, bottom: 28),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomIconButton(
                      height: getSize(50),
                      width: getSize(50),
                      padding: getPadding(all: 13),
                      decoration: IconButtonStyleHelper.fillBlueGray,
                      onTap: () {
                        onTapBtnCarone(context);
                      },
                      child: CustomImageView(svgPath: ImageConstant.imgCar)),
                  Expanded(
                      child: CustomElevatedButton(
                          text: "lbl_book_apointment".tr,
                          margin: getMargin(left: 19),
                          onTap: () {
                            onTapBookapointment(context);
                          }))
                ]))));
  }

  /// Navigates to the previous screen.
  ///
  /// This function takes a [BuildContext] object as a parameter, which is
  /// used to build the navigation stack. When the action is triggered, this
  /// function uses the [NavigatorService] to navigate to the previous screen
  /// in the navigation stack.
  onTapArrowleftone(BuildContext context) {
    NavigatorService.goBack();
  }

  /// Navigates to the chatScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the chatScreen.
  onTapBtnCarone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.chatScreen,
    );
  }

  /// Navigates to the bookAnAppointmentScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the bookAnAppointmentScreen.
  onTapBookapointment(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.bookAnAppointmentScreen,
    );
  }
}
