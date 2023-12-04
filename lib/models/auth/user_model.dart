class User {
  String? name;
  String? email;
  String? phone;
  String? nationalId;
  String? gender;
  String? profileImage;
  String? token;

  User(
      {this.name,
      this.email,
      this.phone,
      this.nationalId,
      this.gender,
      this.profileImage,
      this.token});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    gender = json['gender'];
    profileImage = json['profileImage'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['gender'] = gender;
    data['profileImage'] = profileImage;
    data['token'] = token;
    return data;
  }
}
