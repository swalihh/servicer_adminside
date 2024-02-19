import 'dart:async';

import 'package:adminservice/data/sharedpreferences/login.dart';
import 'package:adminservice/repositories/authrepo.dart';
import 'package:bloc/bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<UserLoginEvent>(adminlogin);
  }
  late String token;

  FutureOr<void> adminlogin(
      UserLoginEvent event, Emitter<LoginState> emit) async {
        emit(AdminLoginLoadingState());
    final data = {
      "username": event.username,
      "password": event.password,
    };
    print('in login bloc');
    final userdata = await AuthRepo().adminLogin(data);

    userdata.fold((error) => emit(AdminLoginErrorState(message: error.message)),
        (responce) {
      final token = responce['token'];
      print('tokkennnn');
      print(token);
      Sharedprfe.instance.addToken(token);
      emit(AdminLoginSucessState());
    });
  }
}
