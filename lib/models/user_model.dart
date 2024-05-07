List<User> usersFromJson(dynamic str) =>
    List<User>.from((str).map((x) => User.fromJson(x)));

class User {
  final String fullName;
  final String email;
  final String? password;

  User({
    required this.fullName,
    required this.email,
    this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['fullName'] = fullName;
    _data['email'] = email;
    _data['password'] = password;
    return _data;
  }
}
