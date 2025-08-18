import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_app_c15_mon/core/constants/app_assets.dart';
import 'package:news_app_c15_mon/core/routes/page_routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        PageRoutesName.home,
        (route) => false,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset(AppAssets.splashBackground)),
    );
  }
}
