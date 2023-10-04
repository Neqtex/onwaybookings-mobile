import '../models/timeslots_item_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimeslotsItemWidget extends StatelessWidget {
  TimeslotsItemWidget(
    this.timeslotsItemModelObj, {
    Key? key,
    this.onSelectedChipView,
  }) : super(
          key: key,
        );

  TimeslotsItemModel timeslotsItemModelObj;

  Function(bool)? onSelectedChipView;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      padding: getPadding(
        left: 23,
        top: 11,
        right: 23,
        bottom: 11,
      ),
      showCheckmark: false,
      labelPadding: EdgeInsets.zero,
      label: Text(
        timeslotsItemModelObj.timeOneTxt,
        style: TextStyle(
          color: timeslotsItemModelObj.isSelected
              ? theme.colorScheme.primary
              : theme.colorScheme.primaryContainer,
          fontSize: getFontSize(
            12,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        ),
      ),
      selected: timeslotsItemModelObj.isSelected,
      backgroundColor: theme.colorScheme.primary,
      selectedColor: appTheme.cyan300,
      shape: timeslotsItemModelObj.isSelected
          ? RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(
                getHorizontalSize(10),
              ),
            )
          : RoundedRectangleBorder(
              side: BorderSide(
                color: appTheme.teal100,
                width: getHorizontalSize(1),
              ),
              borderRadius: BorderRadius.circular(
                getHorizontalSize(10),
              ),
            ),
      onSelected: (value) {
        onSelectedChipView?.call(value);
      },
    );
  }
}
