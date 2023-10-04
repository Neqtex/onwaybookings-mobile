import 'package:flutter_svg/svg.dart';

import 'bloc/splash_bloc.dart';
import 'models/splash_model.dart';
import 'package:chike_s_application/core/app_export.dart';
import 'package:chike_s_application/widgets/custom_elevated_button.dart';
import 'package:chike_s_application/widgets/custom_outlined_button.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static Widget builder(BuildContext context) {
    return BlocProvider<SplashBloc>(
        create: (context) =>
            SplashBloc(SplashState(splashModelObj: SplashModel()))
              ..add(SplashInitialEvent()),
        child: SplashScreen());
  }

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    return BlocBuilder<SplashBloc, SplashState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: appTheme.gray50,
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 17, top: 46, right: 17, bottom: 46),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Spacer(),
                        Image.asset(
                          'assets/images/logo-onway-bookings.png',
                          // you can add width and height properties if you need to size it
                           width: 75,
                           height: 150,
                          fit: BoxFit.fitWidth,
                        ),
                        Text('OnWay Bookings',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                              color: Colors.deepPurple
                            ),
                        ),
                        Text('© 2023 ThirtyFive Studio, LLC',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                              color: Colors.black
                          ),
                        ),
                        SizedBox(height: 40),
                        CustomElevatedButton(
                            text: "Welcome",
                            margin: getMargin(left: 3, top: 15, right: 3),
                            buttonStyle: CustomButtonStyles.fillPrimary,
                            buttonTextStyle: CustomTextStyles.titleSmallTeal300,
                            onTap: () {
                              onTapLogin(context);
                            })
                      ]))));
    });
  }

  /// Navigates to the loginScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the loginScreen.
  onTapLogin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.loginScreen,
    );
  }

  /// Navigates to the signupScreen when the action is triggered.
  ///
  /// The [BuildContext] parameter is used to build the navigation stack.
  /// When the action is triggered, this function uses the [NavigatorService]
  /// to push the named route for the signupScreen.
  onTapSignup(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signupScreen,
    );
  }
}
