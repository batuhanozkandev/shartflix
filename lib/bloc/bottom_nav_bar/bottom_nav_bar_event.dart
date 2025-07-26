abstract class BottomNavBarEvent {}

class BottomNavBarRouteTo extends BottomNavBarEvent {
  final int index;

  BottomNavBarRouteTo(this.index);
}