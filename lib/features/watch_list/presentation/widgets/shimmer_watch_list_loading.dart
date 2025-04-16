import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWatchListLoading extends StatelessWidget {
  const ShimmerWatchListLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0.w),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey[700]!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width) / 3,
              height: 170.h,
              color: Colors.grey[850],
            ),
            SizedBox(
              width: 20.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 70,
                  height: 14,
                  color: Colors.grey[850],
                ),
                SizedBox(
                  height: 16.w,
                ),
                Container(
                  width: 70,
                  height: 14,
                  color: Colors.grey[850],
                ),
                SizedBox(
                  height: 16.w,
                ),
                Container(
                  width: 70,
                  height: 14,
                  color: Colors.grey[850],
                ),
                SizedBox(
                  height: 16.w,
                ),
                Container(
                  width: 70,
                  height: 14,
                  color: Colors.grey[850],
                ),
                SizedBox(
                  height: 16.w,
                ),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}