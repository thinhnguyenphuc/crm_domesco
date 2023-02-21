import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Login extends AuthState {
  @override
  List<Object> get props => [UniqueKey()];
}

class UnLogin extends AuthState {
  @override
  List<Object> get props => [UniqueKey()];
}

class LoginFailed extends AuthState {
  @override
  List<Object> get props => [UniqueKey()];
}
