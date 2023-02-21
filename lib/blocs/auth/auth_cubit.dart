import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:demo_domesco/blocs/auth/auth_state.dart';
import 'package:demo_domesco/repo/auth_repo/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(UnLogin());

  Future<void> login(String username, String password) async {
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    if (await AuthRepo.login(username, password)) {
      emit(Login());
    } else {
      emit(LoginFailed());
    }
  }
}
