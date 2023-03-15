class UserModel {
  String? username;
  String? email;
  String? phone;
  String? userId;
  String? token;
  //File? userImage;

  UserModel({
    this.username,
    this.userId,
    this.email,
    this.phone,
    this.token,
    //this.userImage,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    username = json["username"];
    email = json["email"];
    phone = json["phone"];
    userId = json["userId"];
    token = json["token"];
    //userImage = json["userImage"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["username"] = username;
    data["email"] = email;
    data["phone"] = phone;
    data["userId"] = userId;
    data["token"] = token;
    //data["userImage"] = userImage;

    return data;
  }
}
