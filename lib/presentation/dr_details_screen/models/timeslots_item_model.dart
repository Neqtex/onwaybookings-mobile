// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class is used in the [timeslots_item_widget] screen.
class TimeslotsItemModel extends Equatable {
  TimeslotsItemModel({
    this.timeOneTxt = "09:00 AM",
    this.isSelected = false,
  });

  String timeOneTxt;

  bool isSelected;

  TimeslotsItemModel copyWith({
    String? timeOneTxt,
    bool? isSelected,
  }) {
    return TimeslotsItemModel(
      timeOneTxt: timeOneTxt ?? this.timeOneTxt,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [timeOneTxt, isSelected];
}
