import 'package:flutter_app/app/dependency_injections/init_login_module.dart';
import 'package:flutter_app/app/dependency_injections/init_onboarding_module.dart';
import 'package:flutter_app/presentation/forgot_password/view/forgot_password_view.dart';
import 'package:flutter_app/presentation/login/view/login_view.dart';
import 'package:flutter_app/presentation/main/main_view.dart';
import 'package:flutter_app/presentation/onboarding/view/onboarding_view.dart';
import 'package:flutter_app/presentation/register/register_view.dart';
import 'package:flutter_app/presentation/resources/routes_manager/routes.dart';
import 'package:flutter_app/presentation/resources/other_managers/strings_manager.dart';
import 'package:flutter_app/presentation/splash/splash_view.dart';
import 'package:flutter_app/presentation/store_details/store_details_view.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.onBoardingRoute:
        initOnboardingModule();
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.storeDetailsRoute:
        return MaterialPageRoute(builder: (_) => const StoreDetailsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.noRouteFound),
              ),
              body: const Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
