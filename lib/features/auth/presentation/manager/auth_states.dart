import 'package:doctor_app/core/failures/failures.dart';
import 'package:doctor_app/features/auth/domain/entities/login_or_register_response_entity.dart';

abstract class AuthStates {}

class AuthInitialState extends AuthStates {}

class AuthLoadingState extends AuthStates {}

class LoginSuccessState extends AuthStates {
  LoginOrRegisterResponseEntity response;

  LoginSuccessState(this.response);
}

class LoginErrorState extends AuthStates {
  Failures error;

  LoginErrorState({required this.error});
}

class RegisterSuccessState extends AuthStates {
  LoginOrRegisterResponseEntity response;

  RegisterSuccessState(this.response);
}

class RegisterErrorState extends AuthStates {
  Failures error;

  RegisterErrorState({required this.error});
}
