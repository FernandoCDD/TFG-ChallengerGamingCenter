class MyProfileResponse {
  String? username;
  String? email;
  String? avatar;
  int? horasDisponibles;
  String? createdAt;

  MyProfileResponse(
      {this.username,
      this.email,
      this.avatar,
      this.horasDisponibles,
      this.createdAt});

  MyProfileResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    horasDisponibles = json['horasDisponibles'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['email'] = email;
    data['avatar'] = avatar;
    data['horasDisponibles'] = horasDisponibles;
    data['createdAt'] = createdAt;
    return data;
  }
}
