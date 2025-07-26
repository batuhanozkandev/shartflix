import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/view/auth/log_in_screen.dart';
import 'package:shartflix/view/profile/add_profile_photo_screen.dart';
import 'package:shartflix/widget/button/bottom_nav_button.dart';

import '../../bloc/bottom_nav_bar/bottom_nav_bar_bloc.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_event.dart';
import '../../bloc/bottom_nav_bar/bottom_nav_bar_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
              children: const [
                AddProfilePhotoScreen(),
                LogInScreen(),
              ],
            ),
          );
        },
      ),
    );
  }
}
//context.read<BottomNavBarBloc>().add(BottomNavBarRouteTo(index));

//
