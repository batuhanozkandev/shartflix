import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shartflix/bloc/movie_bloc/movie_bloc.dart';
import 'package:shartflix/bloc/user_bloc/user_bloc.dart';
import 'package:shartflix/core/constant/color.dart';
import 'package:shartflix/helper/app.dart';
import 'package:shartflix/view/auth/log_in_screen.dart';
import 'package:shartflix/view/explore/explore.dart';
import 'package:shartflix/view/profile/add_profile_photo_screen.dart';
import 'package:shartflix/widget/button/bottom_nav_button.dart';

import '../../bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_event.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_state.dart';
import '../../bloc/movie_bloc/movie_event.dart';
import '../../bloc/user_bloc/user_event.dart';
import '../../routes/routes.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  void initState() {
    bool hasToken = App.hasToken();
    if (!hasToken) {
      Future.delayed(1.seconds,() => Get.offAndToNamed(AppPages.logInScreen));
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBarBloc(),
      child: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
          return Scaffold(
            extendBody: true,
            extendBodyBehindAppBar: true,
            bottomNavigationBar: ShartBottomNavBar(),
            body: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: state.pageController,
              children: [
                BlocProvider(
                  create: (_) => MovieBloc(),
                  child: ExploreScreen(),
                ),
                MultiBlocProvider(
                  providers: [
                    BlocProvider<UserBloc>(
                      create: (_) => UserBloc()..add(FetchUserProfile()),
                    ),
                    BlocProvider<MovieBloc>(
                      create: (_) => MovieBloc()..add(FetchFavoriteMovies()),
                    ),
                  ],
                  child: ProfileScreen(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
