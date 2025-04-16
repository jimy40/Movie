import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/colors_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/string_manager.dart.dart';
import 'package:movie_clean_arch_test/core/utilits/constants/text_style_manager.dart';
import 'package:movie_clean_arch_test/core/utilits/home_layout/cubit/navigator_cubit.dart';
import 'package:movie_clean_arch_test/features/movie/presentation/pages/screens/main_movie_screen.dart';
import 'package:movie_clean_arch_test/features/watch_list/presentation/pages/watch_list_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> with TickerProviderStateMixin {
  final List<Widget> screens = [
    const MainMovieScreen(),
    const Center(child: Text('data')),
    const WatchListScreen(),
  ];

  final List<String> tabNames = [
    StringManager.home,
    StringManager.search,
    StringManager.watchList,
  ];

  late MotionTabBarController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MotionTabBarController(
      initialIndex: 0,
      length: tabNames.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NavigationCubit, int>(
      listener: (context, state) {
        if (_tabController.index != state) {
          _tabController.index = state;
        }
      },
      child: BlocBuilder<NavigationCubit, int>(
        builder: (context, state) {
          return Scaffold(
            body: screens[state],
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.ltr,
              child: MotionTabBar(
                tabBarColor: ColorsManager.backgroundColor,
                controller: _tabController,
                labels: tabNames,
                initialSelectedTab: tabNames[0],
                icons: const [
                  Icons.home,
                  Icons.search,
                  Icons.favorite,
                ],
                tabSize: 50,
                tabBarHeight: 55,
                textStyle: TextStyleManager.fontSize14FontWeight500(),
                tabIconColor: Colors.grey,
                tabSelectedColor: ColorsManager.blue,
                tabIconSelectedColor: Colors.white,
                onTabItemSelected: (int index) {
                  context.read<NavigationCubit>().updateIndex(index);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
