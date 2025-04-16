import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/services/service.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/error_component.dart';

import 'package:movie_clean_arch_test/features/movie_details/presentation/bloc/bloc.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/widgets/movie_details_data_toggle_button_components.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/widgets/movie_details_header.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/widgets/movie_details_shimmer_loading.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/widgets/movies_detaile_componente.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/widgets/year_duration_type_component.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/bloc/watch_list_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movieId});
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final selecteddetail = MovieDetailsData
        .values[context.watch<AppManagerCubit>().moviedetailsIndex];
    return Scaffold(
      body: BlocProvider(
        create: (context) => sl<WatchListBloc>(),
        child: BlocProvider(
          create: (context) => sl<MovieDetailsBloc>()
            ..add(GetMovieDetailsEvent(movieId: movieId)),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                MovieDetailsHeader(
                  movieId: movieId,
                ),
                BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
                  builder: (context, state) {
                    switch (state.movieDetailsrequestState) {
                      case RequestState.loading:
                        return const MovieDetailsShimmerLoading();
                      case RequestState.loaded:
                        return Column(
                          children: [
                            MovieDetailsComponenet(
                              movieDetailsEntity: state.movieDetailsData!,
                            ),
                            SizedBox(
                              height: 32.0.h,
                            ),
                            YearDurationTypeComponent(
                                movieDetails: state.movieDetailsData!),
                            SizedBox(
                              height: 32.h,
                            ),
                            const MovieDetailsDataToggleButtonComponents(),
                            SizedBox(
                              height: 12.h,
                            ),
                            switch (selecteddetail) {
                              MovieDetailsData.aboutMovie => Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.0.w),
                                  child: Text(
                                    StringManager.movieDetails,
                                    style: TextStyleManager
                                        .fontSize12FontWeight500(),
                                  ),
                                ),
                              MovieDetailsData.reviews => Center(
                                  child: Text('Reviews',
                                      style: TextStyleManager
                                          .fontSize12FontWeight500())),
                              MovieDetailsData.cast => Center(
                                  child: Text('Casts',
                                      style: TextStyleManager
                                          .fontSize12FontWeight500())),
                            }
                          ],
                        );
                      case RequestState.error:
                        return ErrorComponent(
                            message: state.movieDetailsMessage);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
