import '../models/dr_list_item_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrListItemWidget extends StatelessWidget {
  DrListItemWidget(
    this.drListItemModelObj, {
    Key? key,
    this.onTapRowdrmarcus,
  }) : super(
          key: key,
        );

  DrListItemModel drListItemModelObj;

  VoidCallback? onTapRowdrmarcus;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapRowdrmarcus?.call();
      },
      child: Container(
        padding: getPadding(
          left: 8,
          top: 7,
          right: 8,
          bottom: 7,
        ),
        decoration: AppDecoration.outlineBlueGray.copyWith(
          borderRadius: BorderRadiusStyle.roundedBorder10,
        ),
        child: Row(
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgThumbnail1,
              height: getSize(111),
              width: getSize(111),
            ),
            Padding(
              padding: getPadding(
                left: 18,
                top: 8,
                bottom: 4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    drListItemModelObj.titleTxt,
                    style: CustomTextStyles.titleMedium18,
                  ),
                  Padding(
                    padding: getPadding(
                      top: 5,
                    ),
                    child: Text(
                      drListItemModelObj.chardiologistTxt,
                      style: theme.textTheme.labelLarge,
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      left: 3,
                      top: 16,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgStar,
                          height: getSize(13),
                          width: getSize(13),
                          margin: getMargin(
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 4,
                          ),
                          child: Text(
                            "lbl_4_7".tr,
                            style: CustomTextStyles.labelLargeCyan300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: getPadding(
                      top: 8,
                    ),
                    child: Row(
                      children: [
                        CustomImageView(
                          svgPath: ImageConstant.imgLocation,
                          height: getSize(13),
                          width: getSize(13),
                          margin: getMargin(
                            bottom: 2,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            left: 3,
                          ),
                          child: Text(
                            "lbl_800m_away".tr,
                            style: theme.textTheme.labelLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
