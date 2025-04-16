import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_clean_arch_test/core/services/service.dart';
import 'package:movie_clean_arch_test/core/utilits/app_manager_cubit.dart/app_manager_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/home_layout/cubit/navigator_cubit.dart';
import 'package:movie_clean_arch_test/core/utilits/thems/dark_theme.dart';

import 'package:movie_clean_arch_test/core/utilits/home_layout/screens/home_layout.dart';

void main() async {
  await Future.wait([getItSetup()]);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => AppManagerCubit()),
    BlocProvider(create: (context) => NavigationCubit())
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 864),
      minTextAdapt: true,
      splitScreenMode: true,
      enableScaleText: () => true,
      enableScaleWH: () => true,
      ensureScreenSize: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManager.lightTheme(context),
        home: const HomeLayout(),
      ),
    );
  }
}
