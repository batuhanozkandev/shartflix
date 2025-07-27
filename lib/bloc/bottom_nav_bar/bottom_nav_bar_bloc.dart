import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'bottom_nav_bar_event.dart';
import 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  BottomNavBarBloc()
      : super(BottomNavBarState(
    selectedIndex: 0,
    pageController: PageController(initialPage: 0),
  )) {
    on<BottomNavBarRouteTo>(_onRouteTo);
  }

  void _onRouteTo(
      BottomNavBarRouteTo event,
      Emitter<BottomNavBarState> emit,
      ) {
    state.pageController.jumpToPage(event.index);
    emit(state.copyWith(selectedIndex: event.index));
  }

  @override
  Future<void> close() {
    state.pageController.dispose();
    return super.close();
  }
}