class User {
  final String username;
  final String uid;

  User({this.username, this.uid});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      uid: json['uid'],
    );
  }
}