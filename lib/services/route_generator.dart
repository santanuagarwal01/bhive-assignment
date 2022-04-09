import 'package:bhive_assignment/pages/dashboard_page.dart';
import 'package:bhive_assignment/pages/home_page.dart';
import 'package:bhive_assignment/pages/login_page.dart';
import 'package:bhive_assignment/pages/refer_page.dart';
import 'package:bhive_assignment/pages/signup_page.dart';
import 'package:bhive_assignment/services/routes.dart';
import 'package:flutter/material.dart';

class GeneratedRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Future<dynamic>? navigateTo(String routeName, {Object? args}) {
    return navigatorKey.currentState?.pushNamed(routeName, arguments: args);
  }

  static goBack() {
    return navigatorKey.currentState?.pop();
  }

  static Route<dynamic> onGenerate(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case MyRoutes.signupRoute:
        if (arg is String) {
          return MaterialPageRoute(builder: (_) => SignUpPage(code: arg));
        }
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case MyRoutes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case MyRoutes.loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case MyRoutes.dashboardRoute:
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      case MyRoutes.referRoute:
        return MaterialPageRoute(builder: (_) => const ReferPage());
      default:
        return _onPageNotFound();
    }
  }

  static Route<dynamic> _onPageNotFound() {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('Page Not Found'),
        ),
      ),
    );
  }
}
