class Passwordless {
  String? status;
  bool? success;
  String? token;
  String? message;

  Passwordless({status, success, token, message});

  Passwordless.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['token'] = token;
    data['message'] = message;
    return data;
  }
}
