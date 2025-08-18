import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/background_container.dart';
import 'package:foodly_app/common/reusable_text.dart' show ReusableText;
import 'package:foodly_app/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/constants/uidata.dart';
import 'package:foodly_app/hooks/fetch_all_restaurants.dart';
import 'package:foodly_app/models/restaurant.dart';
import 'package:foodly_app/views/home/widgets/restaurant_widget.dart';
import 'package:foodly_app/views/home/widgets/restaurant_tile.dart';

class AllNearByRestaurants extends HookWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllRestaurants("41007428");
    List<RestaurantModel>? restaurants = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(
          text: "Nearby Restaurants",
          style: appStyle(17, kLightWhite, FontWeight.w600),
        ),
      ),
      body: BackgroundContainer(
        color: kLightWhite,
        child: isLoading
            ? const FoodsListShimmer()
            : Padding(
                padding: EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 12.h),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(restaurants!.length, (i) {
                    RestaurantModel restaurant = restaurants[i];
                    return RestaurantTile(restaurant: restaurant);
                  }),
                ),
              ),
      ),
    );
  }
}
