import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:chike_s_application/presentation/signup_screen/models/signup_model.dart';
import 'package:chike_s_application/data/models/registerDeviceAuth/post_register_device_auth_resp.dart';
import 'package:chike_s_application/data/models/registerDeviceAuth/post_register_device_auth_req.dart';
import 'dart:async';
import 'package:chike_s_application/data/repository/repository.dart';
import 'package:chike_s_application/core/constants/role.dart';
part 'signup_event.dart';
part 'signup_state.dart';

/// A bloc that manages the state of a Signup according to the event that is dispatched to it.
class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc(SignupState initialState) : super(initialState) {
    on<SignupInitialEvent>(_onInitialize);
    on<CreateRegisterEvent>(_callRegisterDeviceAuth);
  }

  final _repository = Repository();

  var postRegisterDeviceAuthResp = PostRegisterDeviceAuthResp();

  _onInitialize(
    SignupInitialEvent event,
    Emitter<SignupState> emit,
  ) async {
    emit(state.copyWith(
        fullNameController: TextEditingController(),
        emailController: TextEditingController(),
        passwordController: TextEditingController(),
        passwordController1: TextEditingController()));
  }

  /// Calls [https://nodedemo.dhiwise.co/device/auth/register] with the provided event and emits the state.
  ///
  /// The [CreateRegisterEvent] parameter is used for handling event data
  /// The [emit] parameter is used for emitting the state
  ///
  /// Throws an error if an error occurs during the API call process.
  FutureOr<void> _callRegisterDeviceAuth(
    CreateRegisterEvent event,
    Emitter<SignupState> emit,
  ) async {
    var postRegisterDeviceAuthReq = PostRegisterDeviceAuthReq(
      username: state.emailController?.text ?? '',
      email: state.emailController?.text ?? '',
      name: state.fullNameController?.text ?? '',
      role: Role.user,
    );
    await _repository.registerDeviceAuth(
      headers: {
        'Content-type': 'application/json',
      },
      requestData: postRegisterDeviceAuthReq.toJson(),
    ).then((value) async {
      postRegisterDeviceAuthResp = value;
      _onRegisterDeviceAuthSuccess(value, emit);
      event.onCreateRegisterEventSuccess?.call();
    }).onError((error, stackTrace) {
      //implement error call
      _onRegisterDeviceAuthError();
      event.onCreateRegisterEventError?.call();
    });
  }

  void _onRegisterDeviceAuthSuccess(
    PostRegisterDeviceAuthResp resp,
    Emitter<SignupState> emit,
  ) {
    PrefUtils().setId(resp.data?.id ?? '');
    emit(
      state.copyWith(
        signupModelObj: state.signupModelObj?.copyWith(),
      ),
    );
  }

  void _onRegisterDeviceAuthError() {
    //implement error method body...
  }
}
