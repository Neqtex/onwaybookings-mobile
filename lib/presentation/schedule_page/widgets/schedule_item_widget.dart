import '../models/schedule_item_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScheduleItemWidget extends StatelessWidget {
  ScheduleItemWidget(
    this.scheduleItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  ScheduleItemModel scheduleItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: getPadding(
        all: 15,
      ),
      decoration: AppDecoration.outlineBlueGray.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder10,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: getPadding(
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: getPadding(
                    bottom: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        scheduleItemModelObj.drmarcushorizonTxt,
                        style: CustomTextStyles.titleMedium18,
                      ),
                      Padding(
                        padding: getPadding(
                          top: 5,
                        ),
                        child: Text(
                          scheduleItemModelObj.chardiologistTxt,
                          style: theme.textTheme.labelLarge,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgDrugthumbnail,
                  height: getSize(46),
                  width: getSize(46),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 25,
              right: 45,
            ),
            child: Row(
              children: [
                CustomImageView(
                  svgPath: ImageConstant.imgCalendarPrimarycontainer,
                  height: getSize(15),
                  width: getSize(15),
                ),
                Padding(
                  padding: getPadding(
                    left: 5,
                  ),
                  child: Text(
                    scheduleItemModelObj.dateTxt,
                    style: CustomTextStyles.labelLargePrimaryContainer_1,
                  ),
                ),
                CustomImageView(
                  svgPath: ImageConstant.imgSearchPrimarycontainer,
                  height: getSize(15),
                  width: getSize(15),
                  margin: getMargin(
                    left: 15,
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 5,
                  ),
                  child: Text(
                    scheduleItemModelObj.timeTxt,
                    style: CustomTextStyles.labelLargePrimaryContainer_1,
                  ),
                ),
                Container(
                  height: getSize(6),
                  width: getSize(6),
                  margin: getMargin(
                    left: 12,
                    top: 5,
                    bottom: 3,
                  ),
                  decoration: BoxDecoration(
                    color: appTheme.green300,
                    borderRadius: BorderRadius.circular(
                      getHorizontalSize(3),
                    ),
                  ),
                ),
                Padding(
                  padding: getPadding(
                    left: 5,
                  ),
                  child: Text(
                    "lbl_confirmed".tr,
                    style: CustomTextStyles.labelLargePrimaryContainer_1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: getPadding(
              top: 14,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CustomElevatedButton(
                    height: getVerticalSize(46),
                    text: "lbl_cancel".tr,
                    margin: getMargin(
                      right: 7,
                    ),
                    buttonStyle: CustomButtonStyles.fillBlueGray,
                    buttonTextStyle:
                        CustomTextStyles.titleSmallPrimaryContainer,
                  ),
                ),
                Expanded(
                  child: CustomElevatedButton(
                    height: getVerticalSize(46),
                    text: "lbl_reschedule".tr,
                    margin: getMargin(
                      left: 7,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
