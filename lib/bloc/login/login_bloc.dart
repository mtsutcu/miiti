import 'dart:async';
import 'package:rxdart/rxdart.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/animation.dart';
import 'package:meta/meta.dart';
import 'package:miiti/repositories/user_repository.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  UserRepository? _userRepository;

  LoginBloc({ required UserRepository userRepository})
      :assert(userRepository != null),
        _userRepository=userRepository, super(null);



  @override
  Stream<LoginState> transformEvents (
      Stream<LoginEvent> events,
      Stream<LoginState> Function(LoginEvent event) next,
      ){
    final nonDebounceStram = events.where((event) {
      return (events is! EmailChanged || events is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (events is EmailChanged || events is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 500));

    return super.transformEvents(nonDebounceStram.mergeWith([debounceStream]), () => null);
  }


  @override
  Stream<LoginState> mapEventToState(LoginEvent event,) async* {
    // TODO: implement mapEventToState
  }
}
