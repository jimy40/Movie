import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/constants_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';

class MovieTypesToggleButtonsComponents extends StatelessWidget {
  const MovieTypesToggleButtonsComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: MovieCategory.values.length,
        itemBuilder: (context, index) {
          final category = MovieCategory.values[index];
          return InkWell(
            onTap: () {
              context.read<AppManagerCubit>().changeMovieType(index);
            },
            child: Column(
              children: [
                Text(
                  ConstantsManager.getMovieCategoryLabel(category),
                  style: TextStyle(
                    color: context
                                .watch<AppManagerCubit>()
                                .movieTypeCurrentIndex ==
                            index
                        ? Colors.white
                        : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4.h),
                if (context.watch<AppManagerCubit>().movieTypeCurrentIndex ==
                    index)
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: const Divider(
                      color: Colors.grey,
                      thickness: 4,
                    ),
                  )
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 12.w);
        },
      ),
    );
  }
}
