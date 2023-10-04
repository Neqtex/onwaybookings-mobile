import '../cart_screen/widgets/cart_item_widget.dart';
import 'bloc/cart_bloc.dart';
import 'models/cart_item_model.dart';
import 'models/cart_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<CartBloc>(
        create: (context) => CartBloc(CartState(cartModelObj: CartModel()))
          ..add(CartInitialEvent()),
        child: CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
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
                title: AppbarSubtitle(text: "lbl_my_cart".tr)),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 24, right: 20, bottom: 24),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: BlocSelector<CartBloc, CartState, CartModel?>(
                              selector: (state) => state.cartModelObj,
                              builder: (context, cartModelObj) {
                                return ListView.separated(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) {
                                      return SizedBox(
                                          height: getVerticalSize(25));
                                    },
                                    itemCount:
                                        cartModelObj?.cartItemList.length ?? 0,
                                    itemBuilder: (context, index) {
                                      CartItemModel model =
                                          cartModelObj?.cartItemList[index] ??
                                              CartItemModel();
                                      return CartItemWidget(model,
                                          onTapRowobhcombi: () {
                                        onTapRowobhcombi(context);
                                      });
                                    });
                              })),
                      Padding(
                          padding: getPadding(top: 25),
                          child: Text("lbl_payment_detail".tr,
                              style: theme.textTheme.titleMedium)),
                      Padding(
                          padding: getPadding(top: 13),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_subtotal".tr,
                                    style: theme.textTheme.bodyMedium),
                                Text("lbl_19_98".tr,
                                    style: theme.textTheme.bodyMedium)
                              ])),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_taxes".tr,
                                    style: theme.textTheme.bodyMedium),
                                Text("lbl_1_00".tr,
                                    style: theme.textTheme.bodyMedium)
                              ])),
                      Padding(
                          padding: getPadding(top: 11),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("lbl_total".tr,
                                    style: CustomTextStyles
                                        .titleSmallPrimaryContainer),
                                Text("lbl_20_98".tr,
                                    style: CustomTextStyles
                                        .titleSmallPrimaryContainer)
                              ])),
                      Padding(padding: getPadding(top: 14), child: Divider()),
                      Padding(
                          padding: getPadding(top: 15),
                          child: Text("lbl_payment_method".tr,
                              style: theme.textTheme.titleMedium)),
                      Container(
                          margin: getMargin(top: 13, bottom: 5),
                          padding: getPadding(all: 14),
                          decoration: AppDecoration.outlineBlueGray.copyWith(
                              borderRadius: BorderRadiusStyle.roundedBorder10),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding: getPadding(left: 8),
                                    child: Text("lbl_visa".tr,
                                        style:
                                            CustomTextStyles.titleMediumBlack)),
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
                                    child: Text("lbl_20_982".tr,
                                        style: CustomTextStyles.titleMedium18))
                              ])),
                      CustomElevatedButton(
                          width: getHorizontalSize(192),
                          text: "lbl_checkout".tr)
                    ]))));
  }

  /// Navigates to the drugDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drugDetailsScreen.
  onTapRowobhcombi(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.drugDetailsScreen);
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
