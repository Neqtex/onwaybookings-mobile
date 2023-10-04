import 'bloc/pharmacy_bloc.dart';
import 'models/pharmacy_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<PharmacyBloc>(
        create: (context) =>
            PharmacyBloc(PharmacyState(pharmacyModelObj: PharmacyModel()))
              ..add(PharmacyInitialEvent()),
        child: PharmacyScreen());
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
                title: AppbarSubtitle(text: "lbl_pharmacy".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgCart,
                      margin:
                          getMargin(left: 20, top: 16, right: 20, bottom: 16),
                      onTap: () {
                        onTapCartone(context);
                      })
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(top: 18, bottom: 18),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocSelector<PharmacyBloc, PharmacyState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                margin: getMargin(left: 20, top: 5, right: 20),
                                controller: searchController,
                                hintText: "msg_search_drugs_category".tr,
                                hintStyle: theme.textTheme.bodySmall!,
                                prefix: Container(
                                    margin: getMargin(
                                        left: 17,
                                        top: 11,
                                        right: 12,
                                        bottom: 11),
                                    child: CustomImageView(
                                        svgPath: ImageConstant.imgSearch)),
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
                                            color: Colors.grey.shade600))));
                          }),
                      Container(
                          width: getHorizontalSize(335),
                          margin: getMargin(left: 20, top: 25, right: 20),
                          padding: getPadding(
                              left: 16, top: 12, right: 16, bottom: 12),
                          decoration: AppDecoration.fillBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    width: getHorizontalSize(176),
                                    margin: getMargin(left: 1, top: 3),
                                    child: Text("msg_order_quickly_w".tr,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: theme.textTheme.titleLarge!
                                            .copyWith(height: 1.25))),
                                CustomElevatedButton(
                                    height: getVerticalSize(30),
                                    width: getHorizontalSize(150),
                                    text: "msg_upload_prescription".tr,
                                    margin: getMargin(top: 2),
                                    buttonTextStyle:
                                        CustomTextStyles.labelLargePrimary)
                              ])),
                      Padding(
                          padding: getPadding(left: 20, top: 49, right: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_popular_product".tr,
                                    style:
                                        CustomTextStyles.titleMediumBlack900),
                                Padding(
                                    padding: getPadding(bottom: 3),
                                    child: Text("lbl_see_all".tr,
                                        style:
                                            CustomTextStyles.bodySmallCyan300))
                              ])),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 21, top: 26),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          GestureDetector(
                                              onTap: () {
                                                onTapDrugs1(context);
                                              },
                                              child: Container(
                                                  padding: getPadding(
                                                      left: 7,
                                                      top: 9,
                                                      right: 7,
                                                      bottom: 9),
                                                  decoration: AppDecoration
                                                      .outlineBlueGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgDrugthumbnail,
                                                            height: getSize(50),
                                                            width: getSize(50),
                                                            alignment: Alignment
                                                                .center,
                                                            margin: getMargin(
                                                                top: 15)),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 1,
                                                                top: 29),
                                                            child: Text(
                                                                "lbl_panadol"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelLargeBlack900)),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 1),
                                                            child: Text(
                                                                "lbl_20pcs".tr,
                                                                style: CustomTextStyles
                                                                    .labelSmall9)),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 1,
                                                                top: 5),
                                                            child: Row(
                                                                children: [
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              1),
                                                                      child: Text(
                                                                          "lbl_15_99"
                                                                              .tr,
                                                                          style:
                                                                              CustomTextStyles.titleSmallBlack900)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgPlus,
                                                                      height:
                                                                          getSize(
                                                                              18),
                                                                      width:
                                                                          getSize(
                                                                              18),
                                                                      margin: getMargin(
                                                                          left:
                                                                              38))
                                                                ]))
                                                      ]))),
                                          Container(
                                              margin: getMargin(left: 21),
                                              padding: getPadding(all: 7),
                                              decoration: AppDecoration
                                                  .outlineBlueGray
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgDrugthumbnail,
                                                        height: getSize(50),
                                                        width: getSize(50),
                                                        alignment:
                                                            Alignment.center,
                                                        margin:
                                                            getMargin(top: 17)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 29),
                                                        child: Text(
                                                            "lbl_bodrex_herbal"
                                                                .tr,
                                                            style: CustomTextStyles
                                                                .labelLargeBlack900)),
                                                    Text("lbl_100ml".tr,
                                                        style: CustomTextStyles
                                                            .labelSmall9),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 8),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 1),
                                                              child: Text(
                                                                  "lbl_7_99".tr,
                                                                  style: CustomTextStyles
                                                                      .titleSmallBlack900)),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgPlus,
                                                              height:
                                                                  getSize(18),
                                                              width:
                                                                  getSize(18),
                                                              margin: getMargin(
                                                                  left: 47))
                                                        ]))
                                                  ]))
                                        ])),
                                    Container(
                                        margin: getMargin(left: 17),
                                        padding: getPadding(all: 7),
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
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgEllipse27image,
                                                  height: getSize(50),
                                                  width: getSize(50),
                                                  alignment: Alignment.center,
                                                  margin: getMargin(top: 17)),
                                              Padding(
                                                  padding: getPadding(top: 28),
                                                  child: Text("lbl_konidin".tr,
                                                      style: CustomTextStyles
                                                          .labelLargeBlack900)),
                                              Padding(
                                                  padding: getPadding(top: 1),
                                                  child: Text("lbl_3pcs".tr,
                                                      style: CustomTextStyles
                                                          .labelSmall9)),
                                              Padding(
                                                  padding: getPadding(top: 7),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child: Text(
                                                            "lbl_5_99".tr,
                                                            style: CustomTextStyles
                                                                .titleSmallBlack900)),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgPlus,
                                                        height: getSize(18),
                                                        width: getSize(18),
                                                        margin:
                                                            getMargin(left: 45))
                                                  ]))
                                            ]))
                                  ])))),
                      Padding(
                          padding: getPadding(left: 20, top: 19, right: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_product_on_sale".tr,
                                    style:
                                        CustomTextStyles.titleMediumBlack900),
                                Padding(
                                    padding: getPadding(top: 2, bottom: 2),
                                    child: Text("lbl_see_all".tr,
                                        style:
                                            CustomTextStyles.bodySmallCyan300))
                              ])),
                      Align(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              padding: getPadding(left: 21, top: 14),
                              child: IntrinsicWidth(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                    Expanded(
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                          GestureDetector(
                                              onTap: () {
                                                onTapDrugs4(context);
                                              },
                                              child: Container(
                                                  padding: getPadding(all: 7),
                                                  decoration: AppDecoration
                                                      .outlineBlueGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        CustomImageView(
                                                            imagePath: ImageConstant
                                                                .imgDrugthumbnail,
                                                            height: getSize(50),
                                                            width: getSize(50),
                                                            alignment: Alignment
                                                                .center,
                                                            margin: getMargin(
                                                                top: 19)),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 28),
                                                            child: Text(
                                                                "lbl_obh_combi"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelLargeBlack900)),
                                                        Text("lbl_75ml".tr,
                                                            style:
                                                                CustomTextStyles
                                                                    .labelSmall9),
                                                        Padding(
                                                            padding: getPadding(
                                                                top: 6),
                                                            child: Row(
                                                                children: [
                                                                  Padding(
                                                                      padding: getPadding(
                                                                          top:
                                                                              1),
                                                                      child: Text(
                                                                          "lbl_9_99"
                                                                              .tr,
                                                                          style:
                                                                              CustomTextStyles.titleSmallBlack900)),
                                                                  CustomImageView(
                                                                      svgPath:
                                                                          ImageConstant
                                                                              .imgPlus,
                                                                      height:
                                                                          getSize(
                                                                              18),
                                                                      width:
                                                                          getSize(
                                                                              18),
                                                                      margin: getMargin(
                                                                          left:
                                                                              45))
                                                                ]))
                                                      ]))),
                                          Container(
                                              margin: getMargin(left: 17),
                                              padding: getPadding(all: 7),
                                              decoration: AppDecoration
                                                  .outlineBlueGray
                                                  .copyWith(
                                                      borderRadius:
                                                          BorderRadiusStyle
                                                              .roundedBorder10),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    CustomImageView(
                                                        imagePath: ImageConstant
                                                            .imgDrugthumbnail,
                                                        height: getSize(50),
                                                        width: getSize(50),
                                                        alignment:
                                                            Alignment.center,
                                                        margin:
                                                            getMargin(top: 19)),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 28),
                                                        child: Text(
                                                            "lbl_betadine".tr,
                                                            style: CustomTextStyles
                                                                .labelLargeBlack900)),
                                                    Text("lbl_50ml".tr,
                                                        style: CustomTextStyles
                                                            .labelSmall9),
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 6),
                                                        child: Row(children: [
                                                          Padding(
                                                              padding:
                                                                  getPadding(
                                                                      top: 1),
                                                              child: Text(
                                                                  "lbl_6_99".tr,
                                                                  style: CustomTextStyles
                                                                      .titleSmallBlack900)),
                                                          CustomImageView(
                                                              svgPath:
                                                                  ImageConstant
                                                                      .imgPlus,
                                                              height:
                                                                  getSize(18),
                                                              width:
                                                                  getSize(18),
                                                              margin: getMargin(
                                                                  left: 45))
                                                        ]))
                                                  ]))
                                        ])),
                                    Container(
                                        margin: getMargin(left: 17),
                                        padding: getPadding(all: 7),
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
                                                MainAxisAlignment.end,
                                            children: [
                                              CustomImageView(
                                                  imagePath: ImageConstant
                                                      .imgDrugthumbnail,
                                                  height: getSize(50),
                                                  width: getSize(50),
                                                  alignment: Alignment.center,
                                                  margin: getMargin(top: 19)),
                                              Padding(
                                                  padding: getPadding(top: 28),
                                                  child: Text("lbl_bodrexin".tr,
                                                      style: CustomTextStyles
                                                          .labelLargeBlack900)),
                                              Text("lbl_50ml".tr,
                                                  style: CustomTextStyles
                                                      .labelSmall9),
                                              Padding(
                                                  padding: getPadding(top: 6),
                                                  child: Row(children: [
                                                    Padding(
                                                        padding:
                                                            getPadding(top: 1),
                                                        child: Text(
                                                            "lbl_7_99".tr,
                                                            style: CustomTextStyles
                                                                .titleSmallBlack900)),
                                                    CustomImageView(
                                                        svgPath: ImageConstant
                                                            .imgPlus,
                                                        height: getSize(18),
                                                        width: getSize(18),
                                                        margin:
                                                            getMargin(left: 47))
                                                  ]))
                                            ]))
                                  ]))))
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

  /// Navigates to the cartScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the cartScreen.
  onTapCartone(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.cartScreen,
    );
  }

  /// Navigates to the drugDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drugDetailsScreen.
  onTapDrugs1(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drugDetailsScreen,
    );
  }

  /// Navigates to the drugDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drugDetailsScreen.
  onTapDrugs4(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.drugDetailsScreen,
    );
  }
}
