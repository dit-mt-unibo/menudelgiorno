class User {
  User({
    required this.id,
    required this.name,
    required this.role,
  });

  int id;
  String name;
  String role;

  static User fromJson(dynamic obj) {
    return User(
      id: obj['id'],
      name: obj['user'],
      role: obj['role'],
    );
  }
}
