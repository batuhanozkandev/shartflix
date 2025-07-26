class User {
  String? id;
  String? name;
  String? email;
  String? photoUrl;

  User({this.id, this.name, this.email, this.photoUrl});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photoUrl = json['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['photoUrl'] = photoUrl;
    return data;
  }
}