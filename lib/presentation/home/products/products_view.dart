import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_tut_app/domain/models/models.dart';
import 'package:new_tut_app/presentation/home/cubit/cubit.dart';
import 'package:new_tut_app/presentation/home/cubit/states.dart';
import 'package:new_tut_app/presentation/resources/color_manger.dart';
import 'package:new_tut_app/presentation/resources/string_manger.dart';
import 'package:new_tut_app/presentation/resources/values_manger.dart';
import '../../reuse_component/reuse.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPaddingManger.p12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: bannerItems(cubit.banner),
                  options: CarouselOptions(
                    autoPlay: true,
                    enableInfiniteScroll: true,
                    height: AppSizeManger.s220,
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                  ),
                ),
                const SizedBox(
                  height: AppSizeManger.s14,
                ),
                const GetTitle(AppStringManger.service),
                const SizedBox(
                  height: AppSizeManger.s8,
                ),
                SizedBox(
                  height: AppSizeManger.s180,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        servicesItems(cubit.services[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      width: AppSizeManger.s12,
                    ),
                    itemCount: cubit.services.length,
                  ),
                ),
                const SizedBox(
                  height: AppSizeManger.s14,
                ),
                const GetTitle(AppStringManger.store),
                const SizedBox(
                  height: AppSizeManger.s8,
                ),
                storesItem(cubit.stores),
              ],
            ),
          ),
        );
      },
    );
  }

  List<Widget> bannerItems(List<BannerAd> banners) {
    return banners.map((banner) {
      return Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: ColorManger.primary,
            width: AppSizeManger.s1_5,
          ),
          borderRadius: BorderRadius.circular(AppSizeManger.s12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppSizeManger.s12),
          child: Image.network(
            banner.image,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
        ),
      );
    }).toList();
  }

  Widget servicesItems(Service services) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizeManger.s12),
        side: BorderSide(
          color: ColorManger.primary,
          width: AppSizeManger.s1_5,
        ),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizeManger.s12),
            child: Image.network(
              services.image,
              fit: BoxFit.cover,
              height: AppSizeManger.s140,
              width: AppSizeManger.s140,
            ),
          ),
          const SizedBox(
            height: AppSizeManger.s6,
          ),
          Text(
            services.title,
          ),
        ],
      ),
    );
  }

  Widget storesItem(List<Stores> stores) {
    return GridView.count(
      crossAxisCount: AppSizeManger.s2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(stores.length, (index) {
        return InkWell(
          onTap: () {},
          child: Card(
            child: Image.network(stores[index].image, fit: BoxFit.cover),
          ),
        );
      }),
    );
  }
}
