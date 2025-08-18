import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/background_container.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/constants/uidata.dart';
import 'package:foodly_app/hooks/fetch_all_categories.dart';
import 'package:foodly_app/models/categories.dart';

import 'package:foodly_app/views/category/widgets/category_tile.dart';

class Allcategories extends HookWidget {
  const Allcategories({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategories();
    List<CategoryModel>? categoriesList = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: Center(
          child: ReusableText(
            text: "Categories",
            style: appStyle(15, kGray, FontWeight.w600),
          ),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          height: height,
          child: isLoading
              ? FoodsListShimmer()
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(categoriesList!.length, (i) {
                    CategoryModel category = categoriesList[i];
                    return CategoryTile(category: category);
                  }),
                ),
        ),
      ),
    );
  }
}
