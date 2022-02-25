part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
}

class UsersInitialState extends UsersState {
  @override
  List<Object> get props => [];
}

class UsersLoadingSuccessState extends UsersState {
  final List<UsersClass> usersClass ;
  const UsersLoadingSuccessState({required this.usersClass});

  @override
  List<Object?> get props => [usersClass];

}

class UsersLoadingErrorState extends UsersState {
  final String errMsg;
  const UsersLoadingErrorState({required this.errMsg});

  @override
  List<Object?> get props => [errMsg];

}