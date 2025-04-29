import 'package:dartz/dartz.dart';
import 'package:doctor_app/features/auth/domain/entities/login_or_register_response_entity.dart';
import 'package:doctor_app/features/auth/domain/repositories/data_source/auth_data_source.dart';
import 'package:doctor_app/features/auth/domain/repositories/repo/auth_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/failures/failures.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failures, LoginOrRegisterResponseEntity>> login(
    String email,
    String password,
  ) async {
    var either = await authDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginOrRegisterResponseEntity>> register(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String rePassword,
  ) async {
    var either = await authDataSource.register(
      name,
      email,
      phone,
      gender,
      password,
      rePassword,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
