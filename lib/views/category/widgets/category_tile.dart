import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/views/category/category_page.dart';
import 'package:get/route_manager.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({super.key, required this.category});

  final dynamic category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 900),
        );
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(category.imageUrl, fit: BoxFit.contain),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(12, kGray, FontWeight.normal),
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded, color: kGray, size: 15.r),
    );
  }
}
