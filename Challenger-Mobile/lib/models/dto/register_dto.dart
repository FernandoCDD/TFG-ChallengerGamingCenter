class RegisterDto {
  String? username;
  String? password;
  String? verifyPassword;
  String? avatar;
  String? email;

  RegisterDto(
      {this.username,
      this.password,
      this.verifyPassword,
      this.avatar,
      this.email});

  RegisterDto.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    verifyPassword = json['verifyPassword'];
    avatar = json['avatar'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['verifyPassword'] = verifyPassword;
    data['avatar'] = avatar;
    data['email'] = email;

    return data;
  }
}
