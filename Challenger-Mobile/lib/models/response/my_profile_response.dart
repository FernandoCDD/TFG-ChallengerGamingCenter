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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatar'] = this.avatar;
    data['horasDisponibles'] = this.horasDisponibles;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
