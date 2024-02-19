part of 'login_bloc.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

class AdminLoginSucessState extends LoginState {}
class AdminLoginLoadingState extends LoginState {}


class AdminLoginErrorState extends LoginState {
  final String message;

  AdminLoginErrorState({required this.message});
}
