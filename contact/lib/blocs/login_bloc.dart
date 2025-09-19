import 'package:flutter_bloc/flutter_bloc.dart';

// // tạo Events -- Bloc Sigin - các sự kiện của Bloc
abstract class LoginEvent {}

// sự kiện khi người dùng gửi thông tin đăng nhập
class LoginSubmitted extends LoginEvent {
  final String username;
  final String password;

  LoginSubmitted(this.username, this.password);
}

// tạo States -- Bloc Sigin -- cac trạng thái của Bloc
abstract class LoginState {}


class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {}

// Bloc - Bloc Sigin - quản lý sự kiện và trạng thái
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());

      //(username: admin, password: 1234) - giả lập đăng nhập 
      await Future.delayed(const Duration(seconds: 1));
      if (event.username == "admin" && event.password == "1234") {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure());
      }
    });
  }
}
