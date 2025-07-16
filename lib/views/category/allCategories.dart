import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/background_container.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:foodly_app/constants/uidata.dart';

class Allcategories extends StatelessWidget {
  const Allcategories({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(categories.length, (i) {
              var category = categories[i];
              return ListTile(
                leading: CircleAvatar(
                  radius: 18.r,
                  backgroundColor: kGrayLight,
                  child: Image.network(
                    category["imageUrl"],
                    fit: BoxFit.contain,
                  ),
                ),
                title: ReusableText(
                  text: category['title'],
                  style: appStyle(12, kGray, FontWeight.normal),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: kGray,
                  size: 15.r,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
