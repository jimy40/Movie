import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/services/service.dart';

import 'package:movie_clean_arch_test/core/utilits/constants/enums.dart';

import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/empty_list.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/error_component.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/bloc/bloc.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/widgets/shimmer_watch_list_loading.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/widgets/watch_list_item_component.dart';

class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WatchListBloc>()..add(GetWatchListEvent()),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
              width: double.infinity,
              child: Center(
                child: Text(
                  StringManager.watchList,
                  style: TextStyleManager.fontSize16FontWeight600(),
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Expanded(
              child: BlocBuilder<WatchListBloc, WatchListState>(
                builder: (context, state) {
                  switch (state.watchListRequestState) {
                    case RequestState.loading:
                      return ListView.builder(
                        itemCount: 2,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const ShimmerWatchListLoading(),
                        ),
                      );

                    case RequestState.loaded:
                      if (state.watchList.isEmpty) {
                        return const EmptyList();
                      } else {
                        return RefreshIndicator(
                          onRefresh: () async {
                            context
                                .read<WatchListBloc>()
                                .add(GetWatchListEvent());
                          },
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 14.h),
                            itemCount: state.watchList.length,
                            itemBuilder: (context, index) =>
                                WatchListItemComponent(
                              watchListMovie: state.watchList[index],
                            ),
                          ),
                        );
                      }

                    case RequestState.error:
                      return ErrorComponent(message: state.watchListMessage);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
