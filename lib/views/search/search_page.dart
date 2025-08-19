import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly_app/common/custom_container.dart';
import 'package:foodly_app/common/custom_text_field.dart';
import 'package:foodly_app/common/shimmers/foodlist_shimmer.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/controllers/search_controller.dart';
import 'package:foodly_app/views/search/loading_widget.dart';
import 'package:foodly_app/views/search/search_results.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsetsGeometry.only(top: 12.h),
            child: CustomTextField(
              controller: _searchController,
              keyBoardType: TextInputType.text,
              hintText: "Search for foods",
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.isTrigger == false) {
                    controller.searchFoods(_searchController.text);
                    controller.setTrigger = true;
                  } else {
                    controller.SearchResults = null;
                    controller.setTrigger = false;
                    _searchController.clear();
                  }
                },
                child: controller.isTrigger == false
                    ? const Icon(Ionicons.search_circle, color: kPrimary)
                    : const Icon(Ionicons.close_circle, color: kRed),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            color: Colors.white,
            containerContent: controller.isLoading
                ? const FoodsListShimmer()
                : controller.SearchResults == null
                ? const LoadingWidget()
                : const SearchResults(),
          ),
        ),
      ),
    );
  }
}
