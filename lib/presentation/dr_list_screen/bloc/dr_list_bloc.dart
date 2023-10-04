import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/dr_list_item_model.dart';
import 'package:chike_s_application/presentation/dr_list_screen/models/dr_list_model.dart';
part 'dr_list_event.dart';
part 'dr_list_state.dart';

/// A bloc that manages the state of a DrList according to the event that is dispatched to it.
class DrListBloc extends Bloc<DrListEvent, DrListState> {
  DrListBloc(DrListState initialState) : super(initialState) {
    on<DrListInitialEvent>(_onInitialize);
  }

  _onInitialize(
    DrListInitialEvent event,
    Emitter<DrListState> emit,
  ) async {
    emit(state.copyWith(
        drListModelObj: state.drListModelObj
            ?.copyWith(drListItemList: fillDrListItemList())));
  }

  List<DrListItemModel> fillDrListItemList() {
    return List.generate(4, (index) => DrListItemModel());
  }
}
