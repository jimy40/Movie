import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/assets_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';

class ErrorComponent extends StatelessWidget {
  const ErrorComponent({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.defaultError,
            height: 70.h,
            color: ColorsManager.grey,
          ),
          SizedBox(
            height: 8.h,
          ),
          Text(message)
        ],
      ),
    );
  }
}
