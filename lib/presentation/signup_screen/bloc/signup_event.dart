// ignore_for_file: must_be_immutable

part of 'signup_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///Signup widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class SignupEvent extends Equatable {}

/// Event that is dispatched when the Signup widget is first created.
class SignupInitialEvent extends SignupEvent {
  @override
  List<Object?> get props => [];
}

///Event that is dispatched when the user calls the https://nodedemo.dhiwise.co/device/auth/register API.
class CreateRegisterEvent extends SignupEvent {
  CreateRegisterEvent({
    this.onCreateRegisterEventSuccess,
    this.onCreateRegisterEventError,
  });

  Function? onCreateRegisterEventSuccess;

  Function? onCreateRegisterEventError;

  @override
  List<Object?> get props => [
        onCreateRegisterEventSuccess,
        onCreateRegisterEventError,
      ];
}
