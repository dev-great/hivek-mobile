class ProfileModel {
  String? status;
  bool? success;
  Data? data;

  ProfileModel({status, success, data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? picture;
  String? email;
  bool? emailVerified;
  bool? phoneVerified;
  int? role;
  String? connectionType;
  String? createdAt;
  String? updatedAt;
  int? iV;
  String? firstName;
  String? occupation;
  String? phone;
  String? lastName;
  String? fullName;
  String? id;

  Data(
      {sId,
      picture,
      email,
      emailVerified,
      phoneVerified,
      role,
      connectionType,
      createdAt,
      updatedAt,
      iV,
      firstName,
      occupation,
      phone,
      lastName,
      fullName,
      id});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    picture = json['picture'];
    email = json['email'];
    emailVerified = json['email_verified'];
    phoneVerified = json['phone_verified'];
    role = json['role'];
    connectionType = json['connection_type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    firstName = json['first_name'];
    occupation = json['occupation'];
    phone = json['phone'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['picture'] = picture;
    data['email'] = email;
    data['email_verified'] = emailVerified;
    data['phone_verified'] = phoneVerified;
    data['role'] = role;
    data['connection_type'] = connectionType;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['first_name'] = firstName;
    data['occupation'] = occupation;
    data['phone'] = phone;
    data['last_name'] = lastName;
    data['full_name'] = fullName;
    data['id'] = id;
    return data;
  }
}
