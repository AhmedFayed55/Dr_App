class LoginOrRegisterResponseEntity {
  LoginOrRegisterResponseEntity({
    this.message,
    this.data,
    this.status,
    this.code,
  });

  String? message;
  LoginOrRegisterDataEntity? data;
  bool? status;
  num? code;
}

class LoginOrRegisterDataEntity {
  LoginOrRegisterDataEntity({this.token, this.username});

  String? token;
  String? username;
}
