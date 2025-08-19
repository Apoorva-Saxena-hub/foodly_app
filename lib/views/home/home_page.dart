import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/custom_appbar.dart';
import 'package:foodly_app/common/custom_container.dart';
import 'package:foodly_app/common/heading.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/views/home/all_nearbyRestaurants.dart';
import 'package:foodly_app/views/home/allfastestfoods.dart';
import 'package:foodly_app/views/home/recommendations.dart';
import 'package:foodly_app/views/home/widgets/category_list.dart';
import 'package:foodly_app/views/home/widgets/food_list.dart';
import 'package:foodly_app/views/home/widgets/nearby_restaurants.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get/route_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGray,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: const CustomAppBar(),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              const CategoryList(),

              Heading(
                text: "Try Something New",
                onTap: () {
                  Get.to(
                    () => const Recommendations(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const FoodList(),
              Heading(
                text: "Nearby Restaurants",
                onTap: () {
                  Get.to(
                    () => const AllNearByRestaurants(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const NearbyRestaurants(),
              Heading(
                text: "Food closer to you",
                onTap: () {
                  Get.to(
                    () => const AllFastestFoods(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900),
                  );
                },
              ),
              const FoodList(),
            ],
          ),
        ),
      ),
    );
  }
}
