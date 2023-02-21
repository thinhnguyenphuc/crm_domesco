import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  @override
  List<Object> get props => [];
}

class Login extends AuthState {
  @override
  List<Object> get props => [];
}

class UnLogin extends AuthState {
  final bool hasClickLogin;

  UnLogin(this.hasClickLogin);
  @override
  List<Object> get props => [hasClickLogin];
}
