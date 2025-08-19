import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly_app/common/custom_container.dart';
import 'package:foodly_app/common/custom_text_field.dart';
import 'package:foodly_app/constants/constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGray,
      appBar: AppBar(
        toolbarHeight: 74.h,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: kOffWhite,
        title: Padding(
          padding: EdgeInsetsGeometry.only(top: 12.h),
          child: CustomTextField(
            controller: _searchController,
            keyBoardType: TextInputType.text,
            hintText: "Search for foods",
            suffixIcon: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.search, color: kGray),
            ),
          ),
        ),
      ),
      body: SafeArea(child: CustomContainer(containerContent: Container())),
    );
  }
}
