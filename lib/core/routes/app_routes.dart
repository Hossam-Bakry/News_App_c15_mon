import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:news_app_c15_mon/modules/home/pages/home_view.dart';
import 'package:news_app_c15_mon/modules/splash/splash_view.dart';

abstract class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PageRoutesName.initial:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
      case PageRoutesName.home:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const SplashView(),
          settings: settings,
        );
    }
  }
}
