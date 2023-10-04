import '../models/settigns_item_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettignsItemWidget extends StatelessWidget {
  SettignsItemWidget(
    this.settignsItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  SettignsItemModel settignsItemModelObj;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getHorizontalSize(63),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomImageView(
            svgPath: ImageConstant.imgLocationPrimary,
            height: getSize(32),
            width: getSize(32),
          ),
          Padding(
            padding: getPadding(
              top: 4,
            ),
            child: Text(
              settignsItemModelObj.heartrateTxt,
              style: theme.textTheme.labelMedium,
            ),
          ),
          Padding(
            padding: getPadding(
              top: 2,
            ),
            child: Text(
              settignsItemModelObj.heartratecountTxt,
              style: CustomTextStyles.titleMediumPrimary_1,
            ),
          ),
        ],
      ),
    );
  }
}
