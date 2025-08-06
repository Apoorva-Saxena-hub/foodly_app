import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/background_container.dart';
import 'package:foodly_app/common/reusable_text.dart' show ReusableText;
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/constants/uidata.dart';
import 'package:foodly_app/views/home/widgets/restaurant_widget.dart';
import 'package:foodly_app/views/home/widgets/restaurant_tile.dart';

class AllNearByRestaurants extends StatelessWidget {
  const AllNearByRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(12.w, 15.h, 12.w, 12.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(restaurants.length, (i) {
              var restaurant = restaurants[i];
              return RestaurantTile(restaurant: restaurant);
            }),
          ),
        ),
      ),
    );
  }
}
