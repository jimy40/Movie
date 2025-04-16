import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/shared_components/cashed_image_component.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/pages/movie_details_screen.dart';

class MovieItemComponent extends StatelessWidget {
  const MovieItemComponent({super.key, required this.movie});
  final MovieEntity movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 50) / 3,
      height: 150.h,
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) => MovieDetailsScreen(
                        movieId: movie.id,
                      )));
        },
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            child: CashedImageComponent(imageUrl: movie.backdropPath)),
      ),
    );
  }
}
