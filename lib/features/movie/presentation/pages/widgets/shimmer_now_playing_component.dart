import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerNowPlayingComponent extends StatelessWidget {
  const ShimmerNowPlayingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            width: double.infinity,
            height: 400,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Column(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 200,
                height: 30,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Shimmer.fromColors(
              baseColor: Colors.white,
              highlightColor: Colors.grey[100]!,
              child: Container(
                width: 150,
                height: 20,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
    );
  }
}
