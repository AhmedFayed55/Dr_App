import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:doctor_app/core/failures/failures.dart';
import 'package:doctor_app/core/networking/api_manager.dart';
import 'package:doctor_app/core/networking/endpoint.dart';
import 'package:doctor_app/features/auth/domain/repositories/data_source/auth_data_source.dart';
import 'package:injectable/injectable.dart';

import '../models/login_or_register_response_dm.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, LoginOrRegisterResponseDm>> login(
    String email,
    String password,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var jsonResponse = await apiManager.postData(
          endPoint: EndPoints.login,
          body: {"email": email, "password": password},
        );
        var loginResponse = LoginOrRegisterResponseDm.fromJson(
          jsonResponse.data,
        );
        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No internet connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginOrRegisterResponseDm>> register(
    String name,
    String email,
    String phone,
    String gender,
    String password,
    String rePassword,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var jsonResponse = await apiManager.postData(
          endPoint: EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "phone": phone,
            "password": password,
            "password_confirmation": rePassword,
          },
        );

        var registerResponse = LoginOrRegisterResponseDm.fromJson(
          jsonResponse.data,
        );

        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: "No internet connection"));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
