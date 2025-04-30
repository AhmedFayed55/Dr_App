import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/failures/failures.dart';
import 'package:doctor_app/features/auth/domain/entities/login_or_register_response_entity.dart';

abstract class AuthRepository {
  Future<Either<Failures, LoginOrRegisterResponseEntity>> login(
    String email,
    String password,
  );

  Future<Either<Failures, LoginOrRegisterResponseEntity>> register(
    String name,
    String email,
    String phone,
    int gender,
    String password,
    String rePassword,
  );
}
