import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';

class ThemeManager {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        textTheme: TextTheme(
          displayLarge: TextStyleManager.fontSize24FontWeight500(),
          displayMedium: TextStyleManager.fontSize22FontWeight500(),
          displaySmall: TextStyleManager.fontSize20FontWeight500(),
          titleMedium: TextStyleManager.fontSize18FontWeight600(),
          titleSmall: TextStyleManager.fontSize16FontWeight600(),
          bodyLarge: TextStyleManager.fontSize14FontWeight600(),
          bodyMedium: TextStyleManager.fontSize14FontWeight700(),
          bodySmall: TextStyleManager.fontSize12FontWeight500(),
        ),
        useMaterial3: false,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          toolbarHeight: 200,
          color: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black, size: 24.sp),
          actionsIconTheme: const IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w300),
        ),
        scaffoldBackgroundColor: ColorsManager.backgroundColor,
        inputDecorationTheme: _inputDecorationTheme,
      );
}

final InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: ColorsManager.textFieldFilledColor,
  contentPadding: EdgeInsets.symmetric(
    vertical: 10.h,
    horizontal: 12.w,
  ),
  prefixIconColor: ColorsManager.iconColor,
  suffixIconColor: ColorsManager.iconColor,
  hintStyle: TextStyleManager.fontSize14FontWeight600(
    color: ColorsManager.iconColor,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: const BorderSide(color: Colors.transparent),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: const BorderSide(color: Colors.transparent),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: const BorderSide(color: Colors.grey),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.r),
    borderSide: const BorderSide(
      color: Colors.blue,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.r),
    borderSide: const BorderSide(color: Colors.red),
  ),
);
