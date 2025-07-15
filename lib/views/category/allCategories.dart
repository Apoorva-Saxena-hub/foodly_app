import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/constants/uidata.dart';
import 'package:foodly_app/views/home/widgets/widgets.dart';

class Allcategories extends StatelessWidget {
  const Allcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        title: ReusableText(
          text: "All Categories",
          style: appStyle(12, kGray, FontWeight.w600),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        height: height,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(categories.length, (i) {
            var category = categories[i];
            return ListTile(
              leading: CircleAvatar(radius: 18.r, backgroundColor: kGrayLight),
            );
          }),
        ),
      ),
    );
  }
}
