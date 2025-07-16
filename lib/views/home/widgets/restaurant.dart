import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/app_style.dart';
import 'package:foodly_app/common/reusable_text.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({
    super.key,
    required this.image,
    required this.rating,
    required this.logo,
    required this.time,
    required this.title,
    this.onTap,
  });

  final String image;
  final String rating;
  final String logo;
  final String time;
  final String title;
  // ignore: non_constant_identifier_names
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * .75,
          height: 192.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kLightWhite,
          ),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(8.w),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 112.h,
                        width: width * 0.8,
                        child: Image.network(image, fit: BoxFit.fitWidth),
                      ),
                    ),
                    Positioned(
                      right: 10.w,
                      top: 10.h,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50.r),
                        child: Container(
                          color: kLightWhite,
                          child: Padding(
                            padding: EdgeInsetsGeometry.all(2.h),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.r),
                              child: Image.network(
                                logo,
                                fit: BoxFit.cover,
                                width: 20.w,
                                height: 20.h,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: title,
                      style: appStyle(12, kDark, FontWeight.w500),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          text: 'Delivery time',
                          style: appStyle(9, kGray, FontWeight.w500),
                        ),
                        SizedBox(width: 10.w),
                        ReusableText(
                          text: time,
                          style: appStyle(9, kDark, FontWeight.w500),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RatingBarIndicator(
                          rating: 5,
                          itemBuilder: (context, index) =>
                              Icon(Icons.star, color: kPrimary),
                          itemCount: 5,
                          itemSize: 15.h,
                        ),
                        SizedBox(width: 20.w),
                        ReusableText(
                          text: "+ $rating reviews and ratings",
                          style: appStyle(12, kDark, FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
