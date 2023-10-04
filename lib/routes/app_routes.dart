import 'package:flutter/material.dart';
import 'package:chike_s_application/presentation/splash_screen/splash_screen.dart';
import 'package:chike_s_application/presentation/login_screen/login_screen.dart';
import 'package:chike_s_application/presentation/signup_screen/signup_screen.dart';
import 'package:chike_s_application/presentation/dashboard_container_screen/dashboard_container_screen.dart';
import 'package:chike_s_application/presentation/dr_list_screen/dr_list_screen.dart';
import 'package:chike_s_application/presentation/dr_details_screen/dr_details_screen.dart';
import 'package:chike_s_application/presentation/book_an_appointment_screen/book_an_appointment_screen.dart';
import 'package:chike_s_application/presentation/chat_screen/chat_screen.dart';
import 'package:chike_s_application/presentation/pharmacy_screen/pharmacy_screen.dart';
import 'package:chike_s_application/presentation/drug_details_screen/drug_details_screen.dart';
import 'package:chike_s_application/presentation/article_screen/article_screen.dart';
import 'package:chike_s_application/presentation/cart_screen/cart_screen.dart';
import 'package:chike_s_application/presentation/ambulance_screen/ambulance_screen.dart';
import 'package:chike_s_application/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';

  static const String loginScreen = '/login_screen';

  static const String signupScreen = '/signup_screen';

  static const String dashboardPage = '/dashboard_page';

  static const String dashboardContainerScreen = '/dashboard_container_screen';

  static const String drListScreen = '/dr_list_screen';

  static const String drDetailsScreen = '/dr_details_screen';

  static const String bookAnAppointmentScreen = '/book_an_appointment_screen';

  static const String chatScreen = '/chat_screen';

  static const String settignsPage = '/settigns_page';

  static const String pharmacyScreen = '/pharmacy_screen';

  static const String drugDetailsScreen = '/drug_details_screen';

  static const String articleScreen = '/article_screen';

  static const String cartScreen = '/cart_screen';

  static const String ambulanceScreen = '/ambulance_screen';

  static const String schedulePage = '/schedule_page';

  static const String scheduleTabContainerPage = '/schedule_tab_container_page';

  static const String messagePage = '/message_page';

  static const String messageTabContainerPage = '/message_tab_container_page';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        splashScreen: SplashScreen.builder,
        loginScreen: LoginScreen.builder,
        signupScreen: SignupScreen.builder,
        dashboardContainerScreen: DashboardContainerScreen.builder,
        drListScreen: DrListScreen.builder,
        drDetailsScreen: DrDetailsScreen.builder,
        bookAnAppointmentScreen: BookAnAppointmentScreen.builder,
        chatScreen: ChatScreen.builder,
        pharmacyScreen: PharmacyScreen.builder,
        drugDetailsScreen: DrugDetailsScreen.builder,
        articleScreen: ArticleScreen.builder,
        cartScreen: CartScreen.builder,
        ambulanceScreen: AmbulanceScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: SplashScreen.builder
      };
}
