import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_tut_app/presentation/resources/assets_manger.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/rouets_manger.dart';

import '../../app/app_pref.dart';
import '../../app/di.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  AppPreferences appPreferences = AppPreferences(sl());

  _startDelay() {
    _timer = Timer(const Duration(seconds: 5), _goNext);
  }

  _goNext() {
    appPreferences.isUserLogged().then((isUserLogged) {
      if (isUserLogged) {
        Navigator.pushReplacementNamed(context, Routes.homeRoute);
      }
    });
    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            AssetsManger.splashLogo,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
