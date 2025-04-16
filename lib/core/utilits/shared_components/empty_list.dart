import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/assets_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          AssetsManager.noMovieFound,
          height: 100.h,
          color: ColorsManager.grey,
        ),
        const Center(child: Text(StringManager.noMovies)),
      ],
    );
  }
}
