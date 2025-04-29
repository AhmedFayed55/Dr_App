import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/auth/domain/repositories/repo/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../entities/login_or_register_response_entity.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, LoginOrRegisterResponseEntity>> invoke(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String rePassword,
  ) {
    return authRepository.register(
      name,
      email,
      phone,
      gender,
      password,
      rePassword,
    );
  }
}
