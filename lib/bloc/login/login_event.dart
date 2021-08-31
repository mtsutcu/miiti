part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get probs => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  EmailChanged({required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => "Email changed: $email";
}

class PasswordChanged extends LoginEvent {
  final String password;

  PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => "Email changed: $password";
}

class CredentialLoginPressed extends LoginEvent{
  final String email;
  final String password;

  CredentialLoginPressed({required this.email,required this.password});
  @override
  List<Object> get props => [email,password];
}
