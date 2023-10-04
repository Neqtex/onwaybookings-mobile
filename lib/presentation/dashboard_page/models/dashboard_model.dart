// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'dashboard_item_model.dart';

/// This class defines the variables used in the [dashboard_page],
/// and is typically used to hold data that is passed between different parts of the application.
class DashboardModel extends Equatable {
  DashboardModel({this.dashboardItemList = const []});

  List<DashboardItemModel> dashboardItemList;

  DashboardModel copyWith({List<DashboardItemModel>? dashboardItemList}) {
    return DashboardModel(
      dashboardItemList: dashboardItemList ?? this.dashboardItemList,
    );
  }

  @override
  List<Object?> get props => [dashboardItemList];
}
