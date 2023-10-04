// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'dr_list_item_model.dart';

/// This class defines the variables used in the [dr_list_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class DrListModel extends Equatable {
  DrListModel({this.drListItemList = const []});

  List<DrListItemModel> drListItemList;

  DrListModel copyWith({List<DrListItemModel>? drListItemList}) {
    return DrListModel(
      drListItemList: drListItemList ?? this.drListItemList,
    );
  }

  @override
  List<Object?> get props => [drListItemList];
}
