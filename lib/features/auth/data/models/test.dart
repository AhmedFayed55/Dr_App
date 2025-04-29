class Test {
  Test({this.message, this.data, this.status, this.code});

  Test.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    code = json['code'];
  }

  String? message;
  Data? data;
  bool? status;
  num? code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['status'] = status;
    map['code'] = code;
    return map;
  }
}

class Data {
  Data({this.name, this.email, this.phone});

  Data.fromJson(dynamic json) {
    name = json['name'] != null ? json['name'].cast<String>() : [];
    email = json['email'] != null ? json['email'].cast<String>() : [];
    phone = json['phone'] != null ? json['phone'].cast<String>() : [];
  }

  List<String>? name;
  List<String>? email;
  List<String>? phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['phone'] = phone;
    return map;
  }
}
