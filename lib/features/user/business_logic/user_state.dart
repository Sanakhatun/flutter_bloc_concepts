import 'package:flutter_bloc_concepts/features/user/data/models/user.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingProgress extends UserState {}

class UserLoadSuccess extends UserState {
  final List<User> user;

  UserLoadSuccess({required this.user});
}

class UserLoadFailure extends UserState {
  final String error;

  UserLoadFailure({required this.error});
}
