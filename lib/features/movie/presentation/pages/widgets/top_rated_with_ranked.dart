import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/pages/movie_details_screen.dart';

class TopRatedWithRank extends StatelessWidget {
  const TopRatedWithRank({super.key, required this.movie, required this.index});
  final MovieEntity movie;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (builder) => MovieDetailsScreen(movieId: movie.id)));
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            height: 250.h,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image(
                      width: MediaQuery.of(context).size.width * .3,
                      height: 210.h,
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          NetworkConstants.imageUrl + movie.backdropPath)),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  (index + 1).toString(),
                  style:
                      const TextStyle(fontSize: 70, color:ColorsManager.blue),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0.w,
                ),
                child: Text(
                  (index + 1).toString(),
                  style: const TextStyle(
                      fontSize: 68, color: ColorsManager.backgroundColor),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
