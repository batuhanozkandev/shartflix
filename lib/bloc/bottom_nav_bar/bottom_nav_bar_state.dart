import 'package:flutter/material.dart';

class BottomNavBarState {
  final int selectedIndex;
  final PageController pageController;

  BottomNavBarState({
    required this.selectedIndex,
    required this.pageController,
  });

  BottomNavBarState copyWith({
    int? selectedIndex,
    PageController? pageController,
  }) {
    return BottomNavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}