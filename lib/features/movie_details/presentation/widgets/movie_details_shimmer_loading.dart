import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart' show Shimmer;

class MovieDetailsShimmerLoading extends StatelessWidget {
  const MovieDetailsShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[700]!,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey[850],
                  borderRadius: BorderRadius.circular(4.r)),
              width: MediaQuery.of(context).size.width,
              height: 200,
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Container(
                  color: Colors.grey[850],
                  width: MediaQuery.of(context).size.width / 3,
                  height: 20,
                ),
                Container(
                  color: Colors.grey[850],
                  width: MediaQuery.of(context).size.width / 3,
                  height: 20,
                ),
                Container(
                  color: Colors.grey[850],
                  width: MediaQuery.of(context).size.width / 3,
                  height: 20,
                ),
              ],
            )
          ],
        ));
  }
}
