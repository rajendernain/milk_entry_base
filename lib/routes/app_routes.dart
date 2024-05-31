import 'package:flutter/material.dart';
import 'package:milk_entry/core/app_export.dart';
import '../presentation/app_navigation_screen/app_navingation_screen.dart';
import '../presentation/auth/login_screen.dart';
import '../presentation/auth/register_screen.dart';
import '../presentation/home_screen_page/home_screen.dart';
import '../presentation/login_register_screen/login_register_screen.dart';
import '../presentation/splaash_screen/splash_screen.dart';

class AppRoutes{
  static const String splashScreen = '/splash_screen';
  static const String loginRegisterScreen = '/login_register_screen';
  static const String loginScreen = '/login_screen';
  static const String registerScreen = '/register_screen';
  static const String homeScreen = '/home_screen';
  static const String appNavigationScreen = '/app_navigation_screen';
  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get route => {
    splashScreen: SplashScreen.builder,
    loginRegisterScreen: LoginRegisterScreen.builder,
    loginScreen: LoginScreen.builder,
    registerScreen: RegisterScreen.builder,
    homeScreen: HomeScreen.builder,
    appNavigationScreen: AppNavigationScreen.builder,
    initialRoute: SplashScreen.builder
  };
}