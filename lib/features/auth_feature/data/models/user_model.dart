class UserModel {
  UserModel({
      this.user, 
      this.token,});

  UserModel.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }
  User? user;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}

class User {
  User({
      this.id, 
      this.name, 
      this.email, 
      this.blocked, 
      this.image, 
      this.createdAt,});

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    blocked = json['blocked'];
    image = json['image'];
    createdAt = json['created_at'];
  }
  num? id;
  String? name;
  String? email;
  bool? blocked;
  String? image;
  String? createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['email'] = email;
    map['blocked'] = blocked;
    map['image'] = image;
    map['created_at'] = createdAt;
    return map;
  }

}