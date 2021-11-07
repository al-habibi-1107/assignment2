class UserModel {
  final String? username;
  final String? password;
  final String? email;
  final String? phone;
  final String? profession;

  UserModel(
      this.username, this.password, this.email, this.phone, this.profession);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(json['username'], json['password'], json['email'],
        json['phone'], json['profession']);
  }

  Map<String, dynamic> toJson() => {
        "username": this.username,
        "password": this.password,
        "email": this.email,
        "phone": this.phone,
        "profession": this.profession
      };
}
