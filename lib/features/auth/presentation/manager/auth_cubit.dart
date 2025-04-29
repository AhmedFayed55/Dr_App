import 'package:doctor_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:doctor_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:doctor_app/features/auth/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  AuthViewModel({required this.loginUseCase, required this.registerUseCase})
    : super(AuthInitialState());
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(
    text: "jooeldaw@gmail.com",
  );
  TextEditingController passwordController = TextEditingController(
    text: "123456@aA",
  );

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(AuthLoadingState());
      var either = await loginUseCase.invoke(
        emailController.text,
        passwordController.text,
      );
      either.fold(
        (error) {
          emit(LoginErrorState(error: error));
        },
        (response) {
          emit(LoginSuccessState(response));
        },
      );
    }
  }

  void register() async {}
}
