part of 'users_bloc.dart';

abstract class UsersEvent extends Equatable {
  const UsersEvent();
}

class LoadUsersEvent extends UsersEvent {
  @override

  List<Object?> get props => [];
}
