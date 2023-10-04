import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:chike_s_application/presentation/pharmacy_screen/models/pharmacy_model.dart';
part 'pharmacy_event.dart';
part 'pharmacy_state.dart';

/// A bloc that manages the state of a Pharmacy according to the event that is dispatched to it.
class PharmacyBloc extends Bloc<PharmacyEvent, PharmacyState> {
  PharmacyBloc(PharmacyState initialState) : super(initialState) {
    on<PharmacyInitialEvent>(_onInitialize);
  }

  _onInitialize(
    PharmacyInitialEvent event,
    Emitter<PharmacyState> emit,
  ) async {
    emit(state.copyWith(searchController: TextEditingController()));
  }
}
