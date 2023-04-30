import 'dart:convert';
import 'package:BTechAppLatihan/models/login_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';

part 'loginstate.dart';


class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void logout() {
    emit(LoginState.initial());
  }


  Future<void> login(String username, String password) async {
    emit(state.copyWith(isLoading: true));

    try {
      final jsonString = await rootBundle.loadString('assets/data/login_data.json');
      final jsonMap = json.decode(jsonString);

      final loginModel = LoginModel.fromJson(jsonMap);

      if (loginModel.username == username && loginModel.password == password) {
        emit(state.copyWith(isLoading: false, isSuccess: true));
      } else {
        emit(state.copyWith(
            isLoading: false, isSuccess: false, error: 'Invalid username or password'));
      }
    } catch (error) {
      emit(state.copyWith(
          isLoading: false, isSuccess: false, error: 'An unknown error occurred'));
    }
  }




  @override
  void onChange(Change<LoginState> change) {
    print(change);
    super.onChange(change);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    print('Cubit Error: $error');
    super.onError(error, stackTrace);
  }
}
