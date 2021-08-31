import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:miiti/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository _userRepository;

  AuthBloc(this._userRepository) : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AppStarted){
      yield* _mapAppStartedToState();
    }else if(event is LogIn){
      yield* _mapLogInToState();

    }else if(event is LogOut){
      yield* _mapLogOutToState();
    }
  }
  Stream<AuthState> _mapAppStartedToState() async* {
    try{
      final isSignedIn = await _userRepository.isSigned();
      if(isSignedIn){
        final userID = await _userRepository.getUser();
        final isFirstTime = await _userRepository.isFirst(userID);
        if(!isFirstTime){
          yield AuthenticatedButNotSet(userID);
        }else {
          yield Authanticated(userID);
        }
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      Unauthenticated();
    }
  }
  Stream<AuthState> _mapLogInToState() async*{
    final userID = await _userRepository.getUser();
    final isFirstTime = await _userRepository.isFirst(userID);
    if(!isFirstTime){
      yield AuthenticatedButNotSet(userID);
    }else {
      yield Authanticated(userID);
    }
  }
  Stream<AuthState> _mapLogOutToState() async*{
    yield Unauthenticated();
    _userRepository.signOut();
  }
}


