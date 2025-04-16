import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/constants_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';

class MovieDetailsDataToggleButtonComponents extends StatelessWidget {
  const MovieDetailsDataToggleButtonComponents({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0.w),
      child: SizedBox(
        height: 48.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: MovieDetailsData.values.length,
          itemBuilder: (context, index) {
            final category = MovieDetailsData.values[index];
            return InkWell(
              onTap: () {
                context.read<AppManagerCubit>().changeMoviedetailsData(index);
              },
              child: Column(
                children: [
                  Text(
                    ConstantsManager.getMovieData(category),
                    style: TextStyle(
                      color:
                          context.watch<AppManagerCubit>().moviedetailsIndex ==
                                  index
                              ? Colors.white
                              : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  if (context.watch<AppManagerCubit>().moviedetailsIndex ==
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
            return SizedBox(width: 32.w);
          },
        ),
      ),
    );
  }
}
