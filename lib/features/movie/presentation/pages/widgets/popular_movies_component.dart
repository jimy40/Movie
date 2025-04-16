import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/empty_list.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/error_component.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/movie_item_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/bloc/movie_bloc.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/shimmer_loading.dart';

class PopularComponent extends StatelessWidget {
  const PopularComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) =>
          previous.popularMoviesRequestState !=
          current.popularMoviesRequestState,
      builder: (context, state) {
        switch (state.popularMoviesRequestState) {
          case RequestState.loading:
            return const ShimmerLoading();
          case RequestState.loaded:
            if (state.popularMovies.isEmpty) {
              return const EmptyList();
            } else {
              return FadeIn(
                duration: const Duration(milliseconds: 500),
                child: Center(
                  child: Wrap(
                    runSpacing: 10.h,
                    children:
                        List.generate(state.popularMovies.length, (index) {
                      final movie = state.popularMovies[index];
                      return MovieItemComponent(movie: movie);
                    }),
                  ),
                ),
              );
            }

          case RequestState.error:
            return ErrorComponent(message: state.popularMoviesMessage);
        }
      },
    );
  }
}
