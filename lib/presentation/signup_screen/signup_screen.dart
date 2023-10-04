import 'bloc/signup_bloc.dart';
import 'models/signup_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/core/utils/validation_functions.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore_for_file: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  static Widget builder(BuildContext context) {
    return BlocProvider<SignupBloc>(
        create: (context) =>
            SignupBloc(SignupState(signupModelObj: SignupModel()))
              ..add(SignupInitialEvent()),
        child: SignupScreen());
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
                          //     height: getVerticalSize(42),
                          //     width: getHorizontalSize(115),
                          //     margin: getMargin(top: 70)),
                          Padding(
                              padding: getPadding(top: 25),
                              child: Text("msg_let_s_get_started".tr,
                                  style: CustomTextStyles
                                      .titleMediumPoppinsOnPrimary)),
                          Padding(
                              padding: getPadding(top: 9),
                              child: Text("msg_create_an_new_account".tr,
                                  style: CustomTextStyles
                                      .bodySmallPoppinsPrimary)),
                          BlocSelector<SignupBloc, SignupState,
                                  TextEditingController?>(
                              selector: (state) => state.fullNameController,
                              builder: (context, fullNameController) {
                                return CustomTextFormField(
                                    controller: fullNameController,
                                    margin: getMargin(top: 26),
                                    hintText: "lbl_full_name".tr,
                                    hintStyle: CustomTextStyles
                                        .bodySmallPoppinsBluegray300,
                                    prefix: Container(
                                        margin: getMargin(
                                            left: 16,
                                            top: 12,
                                            right: 10,
                                            bottom: 12),
                                        child: CustomImageView(
                                            svgPath: ImageConstant.imgUser)),
                                    prefixConstraints: BoxConstraints(
                                        maxHeight: getVerticalSize(48)),
                                    validator: (value) {
                                      if (!isText(value)) {
                                        return "Please enter valid text";
                                      }
                                      return null;
                                    });
                              }),
                          BlocSelector<SignupBloc, SignupState,
                                  TextEditingController?>(
                              selector: (state) => state.emailController,
                              builder: (context, emailController) {
                                return CustomTextFormField(
                                    controller: emailController,
                                    margin: getMargin(top: 8),
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
                          BlocSelector<SignupBloc, SignupState,
                                  TextEditingController?>(
                              selector: (state) => state.passwordController,
                              builder: (context, passwordController) {
                                return CustomTextFormField(
                                    controller: passwordController,
                                    margin: getMargin(top: 8),
                                    hintText: "lbl_password".tr,
                                    hintStyle: CustomTextStyles
                                        .bodySmallPoppinsBluegray300,
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
                          BlocSelector<SignupBloc, SignupState,
                                  TextEditingController?>(
                              selector: (state) => state.passwordController1,
                              builder: (context, passwordController1) {
                                return CustomTextFormField(
                                    controller: passwordController1,
                                    margin: getMargin(top: 8),
                                    hintText: "lbl_password_again".tr,
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
                              text: "lbl_sign_up".tr,
                              margin: getMargin(top: 39),
                              buttonStyle: CustomButtonStyles.fillPrimary,
                              buttonTextStyle:
                                  CustomTextStyles.titleSmallTeal300,
                              onTap: () {
                                onTapSignup(context);
                              }),
                          Spacer(),
                          GestureDetector(
                              onTap: () {
                                onTapTxtHaveanaccount(context);
                              },
                              child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: "lbl_have_an".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(
                                        text: "lbl_account".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(
                                        text: "lbl".tr,
                                        style: CustomTextStyles
                                            .bodySmallPoppinsPrimary_1),
                                    TextSpan(text: " "),
                                    TextSpan(
                                        text: "lbl_sign_in2".tr,
                                        style: CustomTextStyles
                                            .labelLargePoppinsPrimaryBold)
                                  ]),
                                  textAlign: TextAlign.left))
                        ])))));
  }

  /// Calls the https://nodedemo.dhiwise.co/device/auth/register API and triggers a [CreateRegisterEvent] event on the [SignupBloc] bloc.
  ///
  /// Validates the form and triggers a [CreateRegisterEvent] event on the [SignupBloc] bloc if the form is valid.
  /// The [BuildContext] parameter represents current [BuildContext]
  onTapSignup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignupBloc>().add(
            CreateRegisterEvent(
              onCreateRegisterEventSuccess: () {
                _onRegisterDeviceAuthEventSuccess(context);
              },
              onCreateRegisterEventError: () {
                _onRegisterDeviceAuthEventError(context);
              },
            ),
          );
    }
  }

  /// Navigates to the dashboardContainerScreen when the action is triggered.

  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the dashboardContainerScreen.
  void _onRegisterDeviceAuthEventSuccess(BuildContext context) {
    NavigatorService.pushNamedAndRemoveUntil(
      AppRoutes.dashboardContainerScreen,
    );
  }

  /// Displays a toast message using the Fluttertoast library.
  void _onRegisterDeviceAuthEventError(BuildContext context) {
    Fluttertoast.showToast(
        msg: context
                .read<SignupBloc>()
                .postRegisterDeviceAuthResp
                .message
                .toString() ??
            '');
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapTxtHaveanaccount(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }
}
