import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';
import 'package:movie_clean_arch_test/features/watch_list/domain/entities/watch_list_movie_entity.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/widgets/type_year_time_component.dart';
import 'package:shimmer/shimmer.dart';

class WatchListItemComponent extends StatelessWidget {
  const WatchListItemComponent({super.key, required this.watchListMovie});
  final WatchListMovieEntity watchListMovie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .35,
            height: 200.h,
            padding: const EdgeInsets.only(right: 8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              child: CachedNetworkImage(
                width: 120.0.w,
                fit: BoxFit.cover,
                imageUrl: NetworkConstants.imageUrl + watchListMovie.image,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey[850]!,
                  highlightColor: Colors.grey[800]!,
                  child: Container(
                    height: 170.0.h,
                    width: 120.0.w,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .42,
                  child: Text(
                    watchListMovie.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyleManager.fontSize16FontWeight600(),
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.star_border_outlined,
                      color: ColorsManager.orange,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      watchListMovie.voteAverage.toStringAsFixed(1).toString(),
                      style: TextStyleManager.fontSize12FontWeight500(
                          color: ColorsManager.orange),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                RowIconAndTextComponent(
                    icon: Icons.calendar_month_outlined,
                    title: watchListMovie.releaseDate.substring(0, 4)),
                const RowIconAndTextComponent(
                    icon: Icons.watch_later_outlined, title: '140 Minutes'),
                const RowIconAndTextComponent(
                    icon: Icons.sim_card_outlined, title: 'Action')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
