import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/services/service.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/bloc/movie_bloc.dart';

import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/home_header_and_search_field.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/movie_types_toggle_buttons_components.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/now_playing_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/popular_movies_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/search_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/top_rated_component.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/widgets/upcomming_component.dart';

class MainMovieScreen extends StatefulWidget {
  const MainMovieScreen({super.key});

  @override
  State<MainMovieScreen> createState() => _MainMovieScreenState();
}

class _MainMovieScreenState extends State<MainMovieScreen> {
  final searchController = TextEditingController();
  bool isSearch = false;
  List<MovieEntity> searchResults = [];

  @override
  Widget build(BuildContext context) {
    final selectedCategory = MovieCategory
        .values[context.watch<AppManagerCubit>().movieTypeCurrentIndex];

    return BlocProvider(
      create: (context) => sl<MovieBloc>()
        ..add(GetNowPlayingMoviesEvent())
        ..add(GetPopularMoviesEvent())
        ..add(GetTopRatedMoviesEvent())
        ..add(GetUpcomingMoviesEvent()),
      child: SafeArea(
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            final allMovies = [
              ...state.topRatedMovies,
              ...state.nowPlayingMovies,
              ...state.popularMovies,
              ...state.upcommingMovies,
            ];

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeaderAndSearchFieldComponent(
                      searchController: searchController,
                      onChanged: (query) {
                        if (query.isNotEmpty) {
                          setState(() {
                            isSearch = true;
                            searchResults = allMovies
                                .where((movie) => movie.title
                                    .toLowerCase()
                                    .contains(query.toLowerCase()))
                                .toList();
                          });
                        } else {
                          setState(() {
                            isSearch = false;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 16.h),
                    if (isSearch) ...[
                      SearchComponent(movies: allMovies)
                    ] else ...[
                      const TopRatedComponent(),
                      SizedBox(height: 24.h),
                      const MovieTypesToggleButtonsComponents(),
                      SizedBox(height: 24.h),
                      switch (selectedCategory) {
                        MovieCategory.nowPlaying =>
                          const NowPlayingComponanet(),
                        MovieCategory.upcoming => const UpcommingComponent(),
                        MovieCategory.topRated => const TopRatedComponent(
                            isFromToggleButtons: true,
                          ),
                        MovieCategory.popular => const PopularComponent(),
                      }
                    ]
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
