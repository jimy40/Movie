import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/bloc/bloc.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({super.key, required this.movieId});
  final int movieId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0.h),
        child: Row(
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                  if (context.read<AppManagerCubit>().isSelected) {
                    context.read<AppManagerCubit>().addToFavorite();
                  }
                },
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                )),
            const Spacer(),
            const Text(StringManager.details),
            const Spacer(),
            InkWell(
              onTap: () {
                context
                    .read<WatchListBloc>()
                    .add(AddWatchListEvent(id: movieId));

                context.read<AppManagerCubit>().addToFavorite();
              },
              child: Icon(
                context.watch<AppManagerCubit>().isSelected
                    ? Icons.favorite
                    : Icons.favorite_border_rounded,
                color: context.watch<AppManagerCubit>().isSelected
                    ? Colors.red
                    : Colors.white,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
