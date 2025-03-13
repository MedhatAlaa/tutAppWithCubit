import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/presentation/home/cubit/cubit.dart';

import '../../app/di.dart';
import '../resources/color_manger.dart';
import 'cubit/states.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(sl(),sl())..getHome()..getStoreDetails(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              color: ColorManger.primary,
              backgroundColor: ColorManger.black,
              buttonBackgroundColor: Colors.white,
              index: cubit.currentIndex,
              items: const [
                Icon(Icons.home),
                Icon(Icons.store),
                Icon(Icons.design_services),
                Icon(Icons.settings),
              ],
            ),
          );
        },
      ),
    );
  }
}
