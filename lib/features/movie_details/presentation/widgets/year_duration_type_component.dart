import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';

class YearDurationTypeComponent extends StatelessWidget {
  const YearDurationTypeComponent({super.key, required this.movieDetails});
  final MovieDetailsEntity movieDetails;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          const Icon(
            Icons.calendar_today_outlined,
            color: ColorsManager.grey,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            movieDetails.releasedDate.toString().substring(0, 4),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          const Icon(
            Icons.watch_later_outlined,
            color: ColorsManager.grey,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            '${movieDetails.runTime} Minutes',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Spacer(),
          const Icon(
            Icons.sim_card_outlined,
            color: ColorsManager.grey,
          ),
          SizedBox(
            width: 4.w,
          ),
          Text(
            movieDetails.type,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      ),
    );
  }
}
