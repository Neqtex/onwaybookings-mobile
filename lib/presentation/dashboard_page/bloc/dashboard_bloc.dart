import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/dashboard_item_model.dart';
import 'package:chike_s_application/presentation/dashboard_page/models/dashboard_model.dart';
part 'dashboard_event.dart';
part 'dashboard_state.dart';

/// A bloc that manages the state of a Dashboard according to the event that is dispatched to it.
class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(DashboardState initialState) : super(initialState) {
    on<DashboardInitialEvent>(_onInitialize);
  }

  List<DashboardItemModel> fillDashboardItemList() {
    return List.generate(4, (index) => DashboardItemModel());
  }

  _onInitialize(
    DashboardInitialEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
    emit(state.copyWith(
        dashboardModelObj: state.dashboardModelObj
            ?.copyWith(dashboardItemList: fillDashboardItemList())));
  }
}
