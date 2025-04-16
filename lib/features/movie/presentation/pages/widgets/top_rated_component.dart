import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/empty_list.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/error_component.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/movie_item_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/shimmer_loading.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/top_rated_with_ranked.dart';
import 'package:shimmer/shimmer.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key, this.isFromToggleButtons = false});
  final bool isFromToggleButtons;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.topRatedMoviesRequestState !=
          current.topRatedMoviesRequestState,
      builder: (context, state) {
        switch (state.topRatedMoviesRequestState) {
          case RequestState.loading:
            if (isFromToggleButtons) {
              return const ShimmerLoading();
            } else {
              return SizedBox(
                height: 170.h,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    width: 8.w,
                  ),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                      baseColor: Colors.grey[800]!,
                      highlightColor: Colors.grey[700]!,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[850],
                            borderRadius: BorderRadius.circular(12.r)),
                        width: (MediaQuery.of(context).size.width - 80) / 3,
                        height: 170.h,
                      )),
                ),
              );
            }

          case RequestState.loaded:
            if (state.topRatedMovies.isEmpty) {
              return const EmptyList();
            } else {
              if (isFromToggleButtons) {
                return Center(
                  child: Wrap(
                    runSpacing: 10.h,
                    children:
                        List.generate(state.topRatedMovies.length, (index) {
                      final movie = state.topRatedMovies[index];
                      return MovieItemComponent(movie: movie);
                    }),
                  ),
                );
              } else {
                return FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: SizedBox(
                    height: 250.0.h,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(
                        width: 8.w,
                      ),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      itemCount: state.topRatedMovies.length,
                      itemBuilder: (context, index) {
                        final movie = state.topRatedMovies[index];
                        return TopRatedWithRank(movie: movie, index: index);
                      },
                    ),
                  ),
                );
              }
            }

          case RequestState.error:
            return ErrorComponent(message: state.popularMoviesMessage);
        }
      },
    );
  }
}
