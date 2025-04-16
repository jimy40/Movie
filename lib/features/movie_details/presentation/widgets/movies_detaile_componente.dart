import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/network/network_constants.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';
import 'package:movie_clean_arch_test/features/movie_details/domain/entities/movie_details_enityt.dart';

class MovieDetailsComponenet extends StatelessWidget {
  const MovieDetailsComponenet({super.key, required this.movieDetailsEntity});
  final MovieDetailsEntity movieDetailsEntity;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
                image: NetworkImage(
                    NetworkConstants.imageUrl + movieDetailsEntity.imageUrl)),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 50,
                width: MediaQuery.of(context).size.width * .65,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h, left: 16.w),
                  child: Text(
                    movieDetailsEntity.title,
                    style: TextStyleManager.fontSize14FontWeight600(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
                height: 150,
                width: 120,
                fit: BoxFit.cover,
                image: NetworkImage(
                    NetworkConstants.imageUrl + movieDetailsEntity.poster)),
          ),
        ),
      ],
    );
  }
}
