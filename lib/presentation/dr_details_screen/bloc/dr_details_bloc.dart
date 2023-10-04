import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/timeslots_item_model.dart';
import 'package:chike_s_application/presentation/dr_details_screen/models/dr_details_model.dart';
part 'dr_details_event.dart';
part 'dr_details_state.dart';

/// A bloc that manages the state of a DrDetails according to the event that is dispatched to it.
class DrDetailsBloc extends Bloc<DrDetailsEvent, DrDetailsState> {
  DrDetailsBloc(DrDetailsState initialState) : super(initialState) {
    on<DrDetailsInitialEvent>(_onInitialize);
    on<UpdateChipViewEvent>(_updateChipView);
  }

  _updateChipView(
    UpdateChipViewEvent event,
    Emitter<DrDetailsState> emit,
  ) {
    List<TimeslotsItemModel> newList = List<TimeslotsItemModel>.from(
        state.drDetailsModelObj!.timeslotsItemList);
    newList[event.index] =
        newList[event.index].copyWith(isSelected: event.isSelected);
    emit(state.copyWith(
        drDetailsModelObj:
            state.drDetailsModelObj?.copyWith(timeslotsItemList: newList)));
  }

  List<TimeslotsItemModel> fillTimeslotsItemList() {
    return List.generate(9, (index) => TimeslotsItemModel());
  }

  _onInitialize(
    DrDetailsInitialEvent event,
    Emitter<DrDetailsState> emit,
  ) async {
    emit(state.copyWith(
        dateController: TextEditingController(),
        datetwoController: TextEditingController()));
    emit(state.copyWith(
        drDetailsModelObj: state.drDetailsModelObj
            ?.copyWith(timeslotsItemList: fillTimeslotsItemList())));
  }
}
