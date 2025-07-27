import 'package:flutter_bloc/flutter_bloc.dart';
import '../../service/user/user.dart';
import 'user_event.dart';
import 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<FetchUserProfile>((event, emit) async {
      emit(UserLoading());
      try {
        final user = await UserService.getProfile();
        if (user != null) {
          emit(UserLoaded(user));
        } else {
          emit(UserError('User data is null'));
        }
      } catch (e) {
        emit(UserError('Error fetching user: $e'));
      }
    });
  }
}
