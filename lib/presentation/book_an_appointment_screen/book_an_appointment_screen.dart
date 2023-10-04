import 'bloc/book_an_appointment_bloc.dart';
import 'models/book_an_appointment_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class BookAnAppointmentScreen extends StatelessWidget {
  const BookAnAppointmentScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<BookAnAppointmentBloc>(
        create: (context) => BookAnAppointmentBloc(BookAnAppointmentState(
            bookAnAppointmentModelObj: BookAnAppointmentModel()))
          ..add(BookAnAppointmentInitialEvent()),
        child: BookAnAppointmentScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<BookAnAppointmentBloc, BookAnAppointmentState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: theme.colorScheme.primary,
              appBar: CustomAppBar(
                  leadingWidth: getHorizontalSize(45),
                  leading: AppbarImage1(
                      svgPath: ImageConstant.imgArrowleft,
                      margin: getMargin(left: 21, top: 16, bottom: 16),
                      onTap: () {
                        onTapArrowleftone(context);
                      }),
                  centerTitle: true,
                  title: AppbarSubtitle(text: "lbl_apointment".tr)),
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 18, top: 23, right: 18, bottom: 23),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: getMargin(left: 2),
                            padding: getPadding(all: 7),
                            decoration: AppDecoration.outlineBluegray50
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                            child: Row(children: [
                              CustomImageView(
                                  imagePath: ImageConstant.imgThumbnail1,
                                  height: getSize(111),
                                  width: getSize(111)),
                              Padding(
                                  padding:
                                      getPadding(left: 19, top: 8, bottom: 4),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text("msg_dr_marcus_horizon".tr,
                                            style:
                                                CustomTextStyles.titleMedium18),
                                        Padding(
                                            padding: getPadding(top: 5),
                                            child: Text("lbl_chardiologist".tr,
                                                style: theme
                                                    .textTheme.labelLarge)),
                                        Padding(
                                            padding:
                                                getPadding(left: 3, top: 15),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgStar,
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
                                            padding: getPadding(top: 9),
                                            child: Row(children: [
                                              CustomImageView(
                                                  svgPath:
                                                      ImageConstant.imgLocation,
                                                  height: getSize(13),
                                                  width: getSize(13),
                                                  margin: getMargin(bottom: 2)),
                                              Padding(
                                                  padding: getPadding(left: 3),
                                                  child: Text(
                                                      "lbl_800m_away".tr,
                                                      style: theme.textTheme
                                                          .labelLarge))
                                            ]))
                                      ]))
                            ])),
                        Padding(
                            padding: getPadding(left: 2, top: 16, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_date".tr,
                                      style: theme.textTheme.titleMedium),
                                  Padding(
                                      padding: getPadding(top: 4),
                                      child: Text("lbl_change".tr,
                                          style: theme.textTheme.bodySmall))
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 9, right: 36),
                            child: Row(children: [
                              CustomIconButton(
                                  height: getSize(36),
                                  width: getSize(36),
                                  padding: getPadding(all: 8),
                                  decoration:
                                      IconButtonStyleHelper.fillBlueGrayTL18,
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgCalendar)),
                              Padding(
                                  padding:
                                      getPadding(left: 15, top: 9, bottom: 9),
                                  child: Text("msg_wednesday_jun_23".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimaryContainer))
                            ])),
                        Padding(
                            padding: getPadding(top: 13),
                            child: Divider(indent: getHorizontalSize(2))),
                        Padding(
                            padding: getPadding(left: 2, top: 12, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_reason".tr,
                                      style: theme.textTheme.titleMedium),
                                  Padding(
                                      padding: getPadding(top: 4),
                                      child: Text("lbl_change".tr,
                                          style: theme.textTheme.bodySmall))
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 9),
                            child: Row(children: [
                              CustomIconButton(
                                  height: getSize(36),
                                  width: getSize(36),
                                  padding: getPadding(all: 8),
                                  decoration:
                                      IconButtonStyleHelper.fillBlueGrayTL18,
                                  child: CustomImageView(
                                      svgPath: ImageConstant.imgClock)),
                              Padding(
                                  padding:
                                      getPadding(left: 15, top: 11, bottom: 7),
                                  child: Text("lbl_chest_pain".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimaryContainer))
                            ])),
                        Padding(
                            padding: getPadding(top: 13),
                            child: Divider(indent: getHorizontalSize(2))),
                        Padding(
                            padding: getPadding(left: 2, top: 15),
                            child: Text("lbl_payment_detail".tr,
                                style: theme.textTheme.titleMedium)),
                        Padding(
                            padding: getPadding(left: 2, top: 13, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_consultation".tr,
                                      style: theme.textTheme.bodyMedium),
                                  Text("lbl_60_00".tr,
                                      style: theme.textTheme.bodyMedium)
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 11, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_admin_fee".tr,
                                      style: theme.textTheme.bodyMedium),
                                  Text("lbl_01_00".tr,
                                      style: theme.textTheme.bodyMedium)
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 11, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("msg_aditional_discount".tr,
                                      style: theme.textTheme.bodyMedium),
                                  Text("lbl2".tr,
                                      style: theme.textTheme.bodyMedium)
                                ])),
                        Padding(
                            padding: getPadding(left: 2, top: 11, right: 2),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("lbl_total".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimaryContainer),
                                  Text("lbl_61_00".tr,
                                      style: CustomTextStyles
                                          .titleSmallPrimaryContainer)
                                ])),
                        Padding(
                            padding: getPadding(top: 14),
                            child: Divider(indent: getHorizontalSize(2))),
                        Padding(
                            padding: getPadding(left: 2, top: 15),
                            child: Text("lbl_payment_method".tr,
                                style: theme.textTheme.titleMedium)),
                        Container(
                            margin: getMargin(top: 13, right: 5),
                            padding: getPadding(all: 14),
                            decoration: AppDecoration.outlineBluegray50
                                .copyWith(
                                    borderRadius:
                                        BorderRadiusStyle.roundedBorder10),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: getPadding(left: 8),
                                      child: Text("lbl_visa".tr,
                                          style: CustomTextStyles
                                              .titleMediumBlack)),
                                  Padding(
                                      padding: getPadding(top: 4),
                                      child: Text("lbl_change".tr,
                                          style: theme.textTheme.bodySmall))
                                ]))
                      ])),
              bottomNavigationBar: Padding(
                  padding: getPadding(left: 20, right: 20, bottom: 26),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: getPadding(top: 4, bottom: 4),
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("lbl_total".tr,
                                      style: CustomTextStyles
                                          .titleSmallErrorContainer),
                                  Padding(
                                      padding: getPadding(top: 1),
                                      child: Text("lbl_61_002".tr,
                                          style:
                                              CustomTextStyles.titleMedium18))
                                ])),
                        CustomElevatedButton(
                            width: getHorizontalSize(192),
                            text: "lbl_booking".tr)
                      ]))));
    });
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
}
