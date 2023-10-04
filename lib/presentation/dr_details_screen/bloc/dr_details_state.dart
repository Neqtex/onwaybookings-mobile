// ignore_for_file: must_be_immutable

part of 'dr_details_bloc.dart';

/// Represents the state of DrDetails in the application.
class DrDetailsState extends Equatable {
  DrDetailsState({
    this.dateController,
    this.datetwoController,
    this.drDetailsModelObj,
  });

  TextEditingController? dateController;

  TextEditingController? datetwoController;

  DrDetailsModel? drDetailsModelObj;

  @override
  List<Object?> get props => [
        dateController,
        datetwoController,
        drDetailsModelObj,
      ];
  DrDetailsState copyWith({
    TextEditingController? dateController,
    TextEditingController? datetwoController,
    DrDetailsModel? drDetailsModelObj,
  }) {
    return DrDetailsState(
      dateController: dateController ?? this.dateController,
      datetwoController: datetwoController ?? this.datetwoController,
      drDetailsModelObj: drDetailsModelObj ?? this.drDetailsModelObj,
    );
  }
}
