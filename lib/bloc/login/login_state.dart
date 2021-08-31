part of 'login_bloc.dart';

@immutable
class LoginState {
  final bool emailValid;
  final bool passwordVaild;
  final bool submitting;
  final bool succsess;
  final bool failure;

  LoginState({required this.emailValid,
    required this.passwordVaild,
    required this.submitting,
    required this.succsess,
    required this.failure});

  factory LoginState.empty() {
    return LoginState(
        emailValid: true,
        passwordVaild: true,
        submitting: false,
        succsess: false,
        failure: false);
  }

  factory LoginState.lodaing() {
    return LoginState(
        emailValid: true,
        passwordVaild: true,
        submitting: false,
        succsess: false,
        failure: true);
  }

  factory LoginState.failure() {
    return LoginState(
        emailValid: true,
        passwordVaild: true,
        submitting: false,
        succsess: true,
        failure: false);
  }

  LoginState update({
    required final bool emailValid,
    required final bool passwordValid
  }) {
    return copyWith(
      emailValid: emailValid,
      passwordVaild: passwordVaild,
      submitting: false,
      succsess: true,
      failure: false,
    );
  }

  LoginState copyWith({
    bool? emailValid,
    bool? passwordVaild,
    bool? submitEnabled,
    bool? submitting,
    bool? succsess,
    bool? failure,

  }) {
    return LoginState(
        emailValid: emailValid ?? this.emailValid,
        passwordVaild: passwordVaild ?? this.passwordVaild,
        submitting: submitting ?? this.submitting,
        succsess: succsess ?? this.submitting,
        failure: failure ?? this.failure);
  }
}
