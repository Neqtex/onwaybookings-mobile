import '../article_screen/widgets/article_item_widget.dart';
import 'bloc/article_bloc.dart';
import 'models/article_item_model.dart';
import 'models/article_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:chike_s_application/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<ArticleBloc>(
        create: (context) =>
            ArticleBloc(ArticleState(articleModelObj: ArticleModel()))
              ..add(ArticleInitialEvent()),
        child: ArticleScreen());
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
                title: AppbarSubtitle(text: "lbl_articles".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgComponent1,
                      margin: getMargin(all: 20))
                ]),
            body: Container(
                width: double.maxFinite,
                padding: getPadding(left: 20, top: 23, right: 20, bottom: 23),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      BlocSelector<ArticleBloc, ArticleState,
                              TextEditingController?>(
                          selector: (state) => state.searchController,
                          builder: (context, searchController) {
                            return CustomSearchView(
                                controller: searchController,
                                hintText: "msg_search_articles".tr,
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
                      Padding(
                          padding: getPadding(top: 20),
                          child: Text("msg_popular_articles".tr,
                              style: CustomTextStyles.titleMediumBlack900)),
                      Padding(
                          padding: getPadding(top: 13),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    padding: getPadding(
                                        left: 26,
                                        top: 15,
                                        right: 26,
                                        bottom: 15),
                                    decoration: AppDecoration.bg.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10),
                                    child: Text("lbl_covid_19".tr,
                                        style: theme.textTheme.titleSmall)),
                                Container(
                                    padding: getPadding(
                                        left: 30,
                                        top: 15,
                                        right: 30,
                                        bottom: 15),
                                    decoration: AppDecoration.bg.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10),
                                    child: Text("lbl_diet".tr,
                                        style: theme.textTheme.titleSmall)),
                                Container(
                                    padding: getPadding(
                                        left: 26,
                                        top: 15,
                                        right: 26,
                                        bottom: 15),
                                    decoration: AppDecoration.bg.copyWith(
                                        borderRadius:
                                            BorderRadiusStyle.roundedBorder10),
                                    child: Text("lbl_fitness".tr,
                                        style: theme.textTheme.titleSmall))
                              ])),
                      Padding(
                          padding: getPadding(top: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("msg_trending_articles".tr,
                                    style:
                                        CustomTextStyles.titleMediumBlack900),
                                Padding(
                                    padding: getPadding(bottom: 3),
                                    child: Text("lbl_see_all".tr,
                                        style:
                                            CustomTextStyles.bodySmallCyan300))
                              ])),
                      Padding(
                          padding: getPadding(top: 14, right: 12),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Container(
                                        margin: getMargin(right: 8),
                                        padding: getPadding(
                                            left: 7,
                                            top: 5,
                                            right: 7,
                                            bottom: 5),
                                        decoration: AppDecoration
                                            .outlineBluegray10001
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
                                                  height: getVerticalSize(87),
                                                  width: getHorizontalSize(138),
                                                  padding: getPadding(
                                                      left: 1,
                                                      top: 5,
                                                      right: 1,
                                                      bottom: 5),
                                                  decoration: AppDecoration
                                                      .fillGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgBookmark,
                                                      height: getSize(15),
                                                      width: getSize(15),
                                                      alignment:
                                                          Alignment.topRight)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 6, top: 13),
                                                  child: Text("lbl_covid_19".tr,
                                                      style: CustomTextStyles
                                                          .labelSmallCyan3009)),
                                              Container(
                                                  width: getHorizontalSize(106),
                                                  margin: getMargin(
                                                      left: 1, top: 6),
                                                  child: Text(
                                                      "msg_comparing_the_astrazeneca"
                                                          .tr,
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .labelLargePrimaryContainer
                                                          .copyWith(
                                                              height: 1.33))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 1, top: 6),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "lbl_jun_12_2021"
                                                                .tr,
                                                            style:
                                                                CustomTextStyles
                                                                    .labelSmall9),
                                                        Container(
                                                            height: getSize(2),
                                                            width: getSize(2),
                                                            margin: getMargin(
                                                                left: 4,
                                                                top: 4,
                                                                bottom: 4),
                                                            decoration: BoxDecoration(
                                                                color: theme
                                                                    .colorScheme
                                                                    .errorContainer,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            getHorizontalSize(1)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 4),
                                                            child: Text(
                                                                "lbl_6_min_read"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelSmallCyan3009))
                                                      ]))
                                            ]))),
                                Expanded(
                                    child: Container(
                                        margin: getMargin(left: 8),
                                        padding: getPadding(
                                            left: 7,
                                            top: 5,
                                            right: 7,
                                            bottom: 5),
                                        decoration: AppDecoration
                                            .outlineBluegray10001
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
                                                  height: getVerticalSize(87),
                                                  width: getHorizontalSize(138),
                                                  padding: getPadding(
                                                      left: 1,
                                                      top: 5,
                                                      right: 1,
                                                      bottom: 5),
                                                  decoration: AppDecoration
                                                      .fillGray
                                                      .copyWith(
                                                          borderRadius:
                                                              BorderRadiusStyle
                                                                  .roundedBorder10),
                                                  child: CustomImageView(
                                                      svgPath: ImageConstant
                                                          .imgBookmark,
                                                      height: getSize(15),
                                                      width: getSize(15),
                                                      alignment:
                                                          Alignment.topRight)),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 6, top: 13),
                                                  child: Text("lbl_covid_19".tr,
                                                      style: CustomTextStyles
                                                          .labelSmallCyan3009)),
                                              Container(
                                                  width: getHorizontalSize(105),
                                                  margin: getMargin(
                                                      left: 1, top: 6),
                                                  child: Text(
                                                      "msg_the_horror_of_the"
                                                          .tr,
                                                      maxLines: 4,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: CustomTextStyles
                                                          .labelLargePrimaryContainer
                                                          .copyWith(
                                                              height: 1.33))),
                                              Padding(
                                                  padding: getPadding(
                                                      left: 1, top: 3),
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                            "lbl_jun_10_20212"
                                                                .tr,
                                                            style:
                                                                CustomTextStyles
                                                                    .labelSmall9),
                                                        Container(
                                                            height: getSize(2),
                                                            width: getSize(2),
                                                            margin: getMargin(
                                                                left: 4,
                                                                top: 4,
                                                                bottom: 4),
                                                            decoration: BoxDecoration(
                                                                color: theme
                                                                    .colorScheme
                                                                    .errorContainer,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            getHorizontalSize(1)))),
                                                        Padding(
                                                            padding: getPadding(
                                                                left: 4),
                                                            child: Text(
                                                                "lbl_5_min_read2"
                                                                    .tr,
                                                                style: CustomTextStyles
                                                                    .labelSmallCyan3009))
                                                      ]))
                                            ])))
                              ])),
                      Padding(
                          padding: getPadding(top: 23),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("msg_related_articles".tr,
                                    style:
                                        CustomTextStyles.titleMediumBlack900),
                                Padding(
                                    padding: getPadding(top: 3),
                                    child: Text("lbl_see_all".tr,
                                        style:
                                            CustomTextStyles.bodySmallCyan300))
                              ])),
                      Expanded(
                          child: Padding(
                              padding: getPadding(top: 15),
                              child: BlocSelector<ArticleBloc, ArticleState,
                                      ArticleModel?>(
                                  selector: (state) => state.articleModelObj,
                                  builder: (context, articleModelObj) {
                                    return ListView.separated(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        separatorBuilder: (context, index) {
                                          return SizedBox(
                                              height: getVerticalSize(10));
                                        },
                                        itemCount: articleModelObj
                                                ?.articleItemList.length ??
                                            0,
                                        itemBuilder: (context, index) {
                                          ArticleItemModel model =
                                              articleModelObj?.articleItemList[
                                                      index] ??
                                                  ArticleItemModel();
                                          return ArticleItemWidget(model);
                                        });
                                  })))
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
}
