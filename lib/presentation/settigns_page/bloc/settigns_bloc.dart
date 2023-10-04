import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/settigns_item_model.dart';
import 'package:chike_s_application/presentation/settigns_page/models/settigns_model.dart';
part 'settigns_event.dart';
part 'settigns_state.dart';

/// A bloc that manages the state of a Settigns according to the event that is dispatched to it.
class SettignsBloc extends Bloc<SettignsEvent, SettignsState> {
  SettignsBloc(SettignsState initialState) : super(initialState) {
    on<SettignsInitialEvent>(_onInitialize);
  }

  _onInitialize(
    SettignsInitialEvent event,
    Emitter<SettignsState> emit,
  ) async {
    emit(state.copyWith(
        settignsModelObj: state.settignsModelObj
            ?.copyWith(settignsItemList: fillSettignsItemList())));
  }

  List<SettignsItemModel> fillSettignsItemList() {
    return List.generate(3, (index) => SettignsItemModel());
  }
}
