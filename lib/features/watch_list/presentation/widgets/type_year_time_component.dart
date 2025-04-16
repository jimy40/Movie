import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';

class RowIconAndTextComponent extends StatelessWidget {
  const RowIconAndTextComponent(
      {super.key, required this.icon, required this.title});
  final String title;

  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        children: [
          Icon(
            icon,
            color: ColorsManager.grey,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            title,
            style:
                TextStyleManager.fontSize12FontWeight500(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
