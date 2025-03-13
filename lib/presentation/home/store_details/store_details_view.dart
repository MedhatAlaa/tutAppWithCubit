import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/presentation/home/cubit/cubit.dart';
import 'package:new_tut_app/presentation/home/cubit/states.dart';
import 'package:new_tut_app/presentation/resources/string_manger.dart';
import 'package:new_tut_app/presentation/resources/values_manger.dart';
import 'package:new_tut_app/presentation/reuse_component/reuse.dart';

class StoreDetailsView extends StatelessWidget {
  const StoreDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPaddingManger.p12),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  cubit.storeDetails.image,
                  fit: BoxFit.cover,
                  height: AppSizeManger.s200,
                  width: double.infinity,
                ),
                const SizedBox(
                  height: AppSizeManger.s20,
                ),
                const GetTitle(AppStringManger.details),
                const SizedBox(
                  height: AppSizeManger.s8,
                ),
                Text(
                  cubit.storeDetails.details,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppSizeManger.s20,
                ),
                const GetTitle(AppStringManger.service),
                const SizedBox(
                  height: AppSizeManger.s8,
                ),
                Text(
                  cubit.storeDetails.services,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: AppSizeManger.s20,
                ),
                const GetTitle(AppStringManger.aboutStore),
                const SizedBox(
                  height: AppSizeManger.s8,
                ),
                Text(
                  cubit.storeDetails.about,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
