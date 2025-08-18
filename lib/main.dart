import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/routes/app_routes.dart';
import 'package:news_app_c15_mon/core/routes/page_routes_name.dart';
import 'package:news_app_c15_mon/core/theme/theme_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeManager.lightTheme,
      initialRoute: PageRoutesName.initial,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
