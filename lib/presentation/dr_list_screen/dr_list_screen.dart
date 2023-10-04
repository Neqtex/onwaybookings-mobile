import '../dr_list_screen/widgets/dr_list_item_widget.dart';
import 'bloc/dr_list_bloc.dart';
import 'models/dr_list_item_model.dart';
import 'models/dr_list_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_image_1.dart';
import 'package:chike_s_application/widgets/app_bar/appbar_subtitle.dart';
import 'package:chike_s_application/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DrListScreen extends StatelessWidget {
  const DrListScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<DrListBloc>(
        create: (context) =>
            DrListBloc(DrListState(drListModelObj: DrListModel()))
              ..add(DrListInitialEvent()),
        child: DrListScreen());
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
                title: AppbarSubtitle(text: "lbl_top_doctor".tr),
                actions: [
                  AppbarImage(
                      svgPath: ImageConstant.imgComponent1,
                      margin: getMargin(all: 20))
                ]),
            body: Padding(
                padding: getPadding(left: 20, top: 24, right: 20),
                child: BlocSelector<DrListBloc, DrListState, DrListModel?>(
                    selector: (state) => state.drListModelObj,
                    builder: (context, drListModelObj) {
                      return ListView.separated(
                          physics: BouncingScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: getVerticalSize(16));
                          },
                          itemCount: drListModelObj?.drListItemList.length ?? 0,
                          itemBuilder: (context, index) {
                            DrListItemModel model =
                                drListModelObj?.drListItemList[index] ??
                                    DrListItemModel();
                            return DrListItemWidget(model,
                                onTapRowdrmarcus: () {
                              onTapRowdrmarcus(context);
                            });
                          });
                    }))));
  }

  /// Navigates to the drDetailsScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the drDetailsScreen.
  onTapRowdrmarcus(BuildContext context) {
    NavigatorService.pushNamed(AppRoutes.drDetailsScreen);
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
