part of 'user_bloc.dart';

abstract class UserEvent {
  const UserEvent();
}

class UserRequest extends UserEvent {
  /*Take user input*/
  // final String cityName;

  UserRequest();
}
