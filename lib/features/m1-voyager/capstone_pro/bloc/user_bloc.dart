import 'package:bloc/bloc.dart';
import 'user_event.dart';
import 'user_state.dart';

import '../repositories/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  //input: UserEvent, output: UserState
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<FetchUserPressed>((event, emit) async {
      emit(UserLoading());

      try {
        final users = await userRepository.fetchUsers();
        emit(UserLoaded(users));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
