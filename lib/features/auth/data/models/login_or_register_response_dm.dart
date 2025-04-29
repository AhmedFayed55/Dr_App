import 'package:doctor_app/features/auth/domain/entities/login_or_register_response_entity.dart';

class LoginOrRegisterResponseDm extends LoginOrRegisterResponseEntity {
  LoginOrRegisterResponseDm({
    super.message,
    super.data,
    super.status,
    super.code,
  });

  LoginOrRegisterResponseDm.fromJson(dynamic json) {
    message = json['message'];
    data =
        json['data'] != null
            ? LoginOrRegisterDataDm.fromJson(json['data'])
            : null;
    status = json['status'];
    code = json['code'];
  }
}

class LoginOrRegisterDataDm extends LoginOrRegisterDataEntity {
  LoginOrRegisterDataDm({super.token, super.username});

  LoginOrRegisterDataDm.fromJson(dynamic json) {
    token = json['token'];
    username = json['username'];
  }
}
