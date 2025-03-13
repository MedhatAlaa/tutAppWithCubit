import 'package:flutter/material.dart';
import 'package:new_tut_app/presentation/resources/themes_manger.dart';

import '../presentation/resources/rouets_manger.dart';

class MyApp extends StatelessWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      initialRoute: Routes.splashRoute,
      onGenerateRoute: GetRouteGenerator.getRoute,
    );
  }
}
