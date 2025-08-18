import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/shimmers/categories_shimmer.dart'
    show CatergoriesShimmer;
import 'package:foodly_app/hooks/fetch_categories.dart';
import 'package:foodly_app/models/categories.dart' show CategoryModel;
import 'package:foodly_app/views/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategories();
    List<CategoryModel>? categoriesList = hookResult.data;
    final isLoading = hookResult.isLoading;
    final error = hookResult.error;

    return isLoading
        ? const CatergoriesShimmer()
        : error != null
        ? Center(child: Text("Error: $error"))
        : Container(
            height: 80.h,
            padding: EdgeInsets.only(left: 12.w, top: 10.h),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(categoriesList!.length, (i) {
                final category = categoriesList[i];
                return CategoryWidget(category: category);
              }),
            ),
          );
  }
}
