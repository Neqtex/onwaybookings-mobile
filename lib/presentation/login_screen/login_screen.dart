import 'bloc/login_bloc.dart';
import 'models/login_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/core/utils/validation_functions.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore_for_file: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(LoginState(loginModelObj: LoginModel()))
          ..add(LoginInitialEvent()),
        child: LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.cyan300,
            resizeToAvoidBottomInset: false,
            body: Form(
                key: _formKey,
                child: Container(
                    width: double.maxFinite,
                    padding:
                        getPadding(left: 15, top: 35, right: 15, bottom: 35),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // CustomImageView(
                          //     imagePath: ImageConstant.imgHidoclogo42x115,
                          //     height: getVerticalSize(15),
                          //     width: getHorizontalSize(15),
                          //     margin: getMargin(top: 70)),
                          Padding(
                              padding: getPadding(top: 24),
                              child: Text("msg_welcome_to_hidoc".tr,
                                  style: CustomTextStyles
                                      .titleMediumPoppinsOnErrorContainer)),
                          Padding(
                              padding: getPadding(top: 11),
                              child: Text("msg_sign_in_to_continue".tr,
                                  style:
                                      CustomTextStyles.bodySmallPoppinsGray50)),
                          BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    margin: getMargin(top: 28),
                                    hintText: "lbl_your_email".tr,
                                    hintStyle: CustomTextStyles
                                        .bodySmallPoppinsBluegray300,
                                    textInputType: TextInputType.emailAddress,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 16,
                                            top: 12,
                                            right: 10,
                                            bottom: 12),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgMail)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(48)),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidEmail(value,
                                              isRequired: true))) {
                                        return "Please enter valid email";
                                      }
                                      return null;
                                    });
                              }),
                          BlocSelector<LoginBloc, LoginState,
                                  TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                    controller: passwordController,
                                    margin: getMargin(top: 8),
                                    hintText: "lbl_password".tr,
                                    hintStyle: CustomTextStyles
                                        .bodySmallPoppinsBluegray300,
                                    textInputAction: TextInputAction.done,
                                    textInputType:
                                        TextInputType.visiblePassword,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 16,
                                            top: 12,
                                            right: 10,
                                            bottom: 12),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgLock)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(48)),
                                    validator: (value) {
                                      if (value == null ||
                                          (!isValidPassword(value,
                                              isRequired: true))) {
                                        return "Please enter valid password";
                                      }
                                      return null;
                                    },
                                    obscureText: true);
                              }),
                          CustomElevatedButton(
                              text: "lbl_sign_in".tr,
                              margin: getMargin(top: 27),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallTeal300,
                              onTap: () {
                                onTapSignin(context);
                              }),
                          Padding(
                              padding: getPadding(top: 23),
                              child: Text("msg_forgot_password".tr,
                                  style: CustomTextStyles
                                      .labelLargePoppinsPrimary)),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtDonthaveanaccount(context);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "msg_don_t_have_an_account2".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_register".tr,
                                        style: CustomTextStyles
                                            .labelLargePoppinsPrimaryBold)
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  Future<bool> validateUser(String email, String password) async {
    final String apiUrl = "https://enterprise-service-aaee0207ddcf.herokuapp.com:443/login/credential/mkros/Mkross4%21";
    final response = await http.get(
      Uri.parse(apiUrl),
      // headers: {"Origin": "https://enterprise-cors-proxy-3f888ad81b37.herokuapp.com",
      //   "X-Requested-With": "XMLHttpRequest"
      // },
    );

    if (response.statusCode == 200) {
      print('FUCKING AYEEE-> '+response.body.trim());
      final Map<String, dynamic> personData = jsonDecode(response.body);
      String email_address = personData['email_address'].trim();
      if (email_address == email
          // && personData['person_password'] == password
      ) {
        return true;
      }
    }
    return false;
  }

  /// Calls the https://nodedemo.dhiwise.co/device/auth/login API and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateLoginEvent] event on the [LoginBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  onTapSignin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String email = context.read<LoginBloc>().state.emailController?.text ?? '';
      String password = context.read<LoginBloc>().state.passwordController?.text ?? '';

      bool isValidUser = await validateUser(email, password);

      if(isValidUser) {
        _onLoginDeviceAuthEventSuccess(context);
      } else {
        _onLoginDeviceAuthEventError(context);
      }
    }
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the dashboardContainerScreen.
  void _onLoginDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onLoginDeviceAuthEventError(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Invalid username or password!",
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapTxtDonthaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
