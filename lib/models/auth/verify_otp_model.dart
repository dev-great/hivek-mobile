class VerifyOTP {
  String? status;
  bool? success;
  String? token;

  VerifyOTP({status, success, token});

  VerifyOTP.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    data['token'] = token;
    return data;
  }
}
