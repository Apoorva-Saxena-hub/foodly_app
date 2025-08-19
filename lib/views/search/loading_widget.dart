import 'package:flutter/material.dart';
import 'package:foodly_app/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 180),
        child: LottieBuilder.asset(
          "assets/anime/delivery.json",
          width: width,
          height: height / 2,
        ),
      ),
    );
  }
}
