import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/controllers/search_controller.dart';
import 'package:foodly_app/models/food.dart';
import 'package:foodly_app/views/home/widgets/food_tile.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: ListView.builder(
        itemCount: controller.SearchResults!.length,
        itemBuilder: (context, i) {
          FoodsModel food = controller.SearchResults![i];
          return FoodTile(food: food);
        },
      ),
    );
  }
}
