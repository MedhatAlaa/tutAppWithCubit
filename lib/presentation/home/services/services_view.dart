import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/models.dart';
import '../../resources/color_manger.dart';
import '../../resources/values_manger.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class ServicesView extends StatelessWidget {
  const ServicesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPaddingManger.p12),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) =>
                storeDetailsItem(cubit.services[index]),
            separatorBuilder: (context, index) => const SizedBox(
              height: AppSizeManger.s12,
            ),
            itemCount: cubit.services.length,
          ),
        );
      },
    );
  }

  Widget storeDetailsItem(Service service) {
    return Row(
      children: [
        Image.network(
          service.image,
          fit: BoxFit.cover,
          height: AppSizeManger.s140,
          width: AppSizeManger.s140,
        ),
        const SizedBox(
          width: AppSizeManger.s18,
        ),
        Text(
          service.title,
          style:
              TextStyle(color: ColorManger.white, fontSize: AppSizeManger.s18),
        ),
        const Spacer(),
        Icon(
          Icons.arrow_forward_ios_sharp,
          color: ColorManger.primary,
        ),
      ],
    );
  }
}
