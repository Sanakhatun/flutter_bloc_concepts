import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_concepts/features/user/business_logic/user_state.dart';
import 'package:flutter_bloc_concepts/features/user/data/repositories/user_repository.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final _userRepository = UserRepository();

  UserBloc() : super(UserInitial()) {
    on<UserRequest>(mapToEventState);
  }

  void mapToEventState(UserRequest event, Emitter<UserState> emit) async {
    emit(UserLoadingProgress());
    if (event is UserRequest) {
      try {
        final userResponse = await _userRepository.getUsers();
        emit(UserLoadSuccess(user: userResponse));
      } catch (e) {
        emit(UserLoadFailure(error: e.toString()));
      }
    }
  }
}
