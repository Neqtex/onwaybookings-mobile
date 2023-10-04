// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'timeslots_item_model.dart';

/// This class defines the variables used in the [dr_details_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DrDetailsModel extends Equatable {
  DrDetailsModel({this.timeslotsItemList = const []});

  List<TimeslotsItemModel> timeslotsItemList;

  DrDetailsModel copyWith({List<TimeslotsItemModel>? timeslotsItemList}) {
    return DrDetailsModel(
      timeslotsItemList: timeslotsItemList ?? this.timeslotsItemList,
    );
  }

  @override
  List<Object?> get props => [timeslotsItemList];
}
