import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:new_tut_app/app/app.dart';
import 'package:new_tut_app/app/bloc_observer.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initAppModule();
  runApp(MyApp());
}
