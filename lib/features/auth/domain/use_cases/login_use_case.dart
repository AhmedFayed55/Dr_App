import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/auth/domain/repositories/repo/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';
import '../entities/login_or_register_response_entity.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  Future<Either<Failures, LoginOrRegisterResponseEntity>> invoke(
    String email,
    String password,
  ) {
    return authRepository.login(email, password);
  }
}
