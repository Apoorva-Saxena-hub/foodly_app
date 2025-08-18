import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/shimmers/nearby_shimmer.dart';
import 'package:foodly_app/constants/uidata.dart';
import 'package:foodly_app/hooks/fetch_all_restaurants.dart';
import 'package:foodly_app/hooks/fetch_restaurants.dart';
import 'package:foodly_app/models/restaurant.dart';
import 'package:foodly_app/views/home/widgets/restaurant_widget.dart';

class NearbyRestaurants extends HookWidget {
  const NearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurants("41007428");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return isLoading
        ? NearbyShimmer()
        : Container(
            height: 190.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(restaurants!.length, (i) {
                RestaurantModel restaurant = restaurants[i];
                return Restaurant(
                  image: restaurant.imageUrl,
                  logo: restaurant.logoUrl,
                  title: restaurant.title,
                  time: restaurant.time,
                  rating: restaurant.rating.toString(),
                );
              }),
            ),
          );
  }
}
