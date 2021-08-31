part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}


class Authanticated extends AuthState{
  final String userID;

  Authanticated(this.userID);

  @override
  // TODO: implement props
  List<Object?> get props => [userID];

  @override
  String toString() {

    return "Authenticated $userID";
  }

}

class AuthenticatedButNotSet extends AuthState{
  final String userID;

  AuthenticatedButNotSet(this.userID);

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}


class Unauthenticated extends AuthState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}