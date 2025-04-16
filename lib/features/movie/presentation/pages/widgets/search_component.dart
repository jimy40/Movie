import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/features/movie/domain/entities/movie_entity.dart';
import 'package:movie_clean_arch_test/features/movie_details/presentation/pages/movie_details_screen.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key, required this.movies});
  final List<MovieEntity> movies;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringManager.searchResults,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8.h),
        ...movies.map((movie) => InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) =>
                            MovieDetailsScreen(movieId: movie.id)));
              },
              child: ListTile(
                title: Text(movie.title),
                subtitle: Text('Rating: ${movie.voteAverage}'),
              ),
            )),
      ],
    );
  }
}
