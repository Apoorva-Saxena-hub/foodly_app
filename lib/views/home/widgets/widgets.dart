import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/controllers/categories_controller.dart';
import 'package:foodly_app/views/category/allCategories.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({super.key, required this.category});

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoriesController());
    return GestureDetector(
      onTap: () {
        if (controller.categoryValue == category['_id']) {
          controller.updateCategory = '';
          controller.updateTitle = '';
        } else if (category['value'] == 'more') {
          Get.to(
            () => Allcategories(),
            transition: Transition.fadeIn,
            duration: const Duration(milliseconds: 900),
          );
        } else {
          controller.updateCategory = category['_id'];
          controller.updateTitle = category['title'];
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: controller.categoryValue == category['_id']
                  ? kSecondary
                  : kOffWhite,
              width: 0.5.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,

                child: Image.network(
                  category['imageUrl'],
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/placeholder.png');
                  },
                ),
              ),
              ReusableText(
                text: category['title'],
                style: appStyle(12, kDark, FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
