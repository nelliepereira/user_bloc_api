import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_bloc_api/api_connection/users_repository.dart';
import 'package:user_bloc_api/model/users_class.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final UsersRepository usersRepository;

  UsersBloc(this.usersRepository) : super(UsersInitialState()) {
    on<UsersEvent>((event, emit) async {
      emit(UsersInitialState());

      try {
        final userdata = await usersRepository.getUsersApiData();
        emit(UsersLoadingSuccessState(usersClass:userdata));
      } catch(e) {
        emit(UsersLoadingErrorState(errMsg: e.toString()));
      }

    });
  }
}
