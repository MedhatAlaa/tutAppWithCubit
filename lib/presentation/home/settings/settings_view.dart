import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:new_tut_app/presentation/home/cubit/cubit.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/values_manger.dart';

import '../../resources/assets_manger.dart';
import '../../resources/string_manger.dart';
import '../cubit/states.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(AppPaddingManger.p12),
          child: Column(
            children: [
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(
                  AssetsManger.changeLang,
                  height: AppSizeManger.s20,
                ),
                title: Text(
                  AppStringManger.changLang,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManger.primary,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(
                  AssetsManger.contactUs,
                  height: AppSizeManger.s20,
                ),
                title: Text(
                  AppStringManger.contactUs,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManger.primary,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(
                  AssetsManger.inviteFriends,
                  height: AppSizeManger.s20,
                ),
                title: Text(
                  AppStringManger.inviteFriends,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManger.primary,
                ),
              ),
              ListTile(
                onTap: () {},
                leading: SvgPicture.asset(
                  AssetsManger.logout,
                  height: AppSizeManger.s20,
                ),
                title: Text(
                  AppStringManger.logout,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorManger.primary,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
