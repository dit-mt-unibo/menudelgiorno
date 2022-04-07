class Registry {
  Registry({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  int id;
  String firstName;
  String lastName;
  String email;

  static Registry fromJson(dynamic obj) {
    return Registry(
      id: obj['registry']['id'],
      firstName: obj['registry']['first_name'],
      lastName: obj['registry']['last_name'],
      email: obj['registry']['email'],
    );
  }
}
