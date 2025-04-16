import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';

class HomeHeaderAndSearchFieldComponent extends StatelessWidget {
  const HomeHeaderAndSearchFieldComponent(
      {super.key, required this.searchController, required this.onChanged});
  final TextEditingController searchController;
  final void Function(String) onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        Text(
          StringManager.whatDoyouWantToWatch,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 24.h),
        TextFormField(
          onChanged: onChanged,
          controller: searchController,
          style: TextStyleManager.fontSize14FontWeight500(),
          decoration: const InputDecoration(
              suffixIcon: Icon(Icons.search), hintText: StringManager.search),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
