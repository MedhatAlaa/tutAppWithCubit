import 'package:flutter/material.dart';
import 'package:new_tut_app/presentation/forget_password/forget_password_view.dart';
import 'package:new_tut_app/presentation/home/home_view.dart';
import 'package:new_tut_app/presentation/login/login_view.dart';
import 'package:new_tut_app/presentation/register/register_view.dart';
import 'package:new_tut_app/presentation/resources/string_manger.dart';
import 'package:new_tut_app/presentation/splash/splash_view.dart';

import '../../app/di.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String forgetPasswordRoute = '/forgetPassword';
  static const String homeRoute = '/home';
  static const String storeDetailsRoute = '/storeDetails';
}

class GetRouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        initRegisterModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgetPasswordRoute:
        initForgetPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      case Routes.homeRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStringManger.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStringManger.noRouteFound),
        ),
      ),
    );
  }
}
