class ChangePasswordDto {
  String? oldPassword;
  String? newPassword;
  String? verifyPassword;

  ChangePasswordDto({this.oldPassword, this.newPassword, this.verifyPassword});

  ChangePasswordDto.fromJson(Map<String, dynamic> json) {
    oldPassword = json['oldPassword'];
    newPassword = json['newPassword'];
    verifyPassword = json['verifyPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oldPassword'] = oldPassword;
    data['newPassword'] = newPassword;
    data['verifyPassword'] = verifyPassword;
    return data;
  }
}
