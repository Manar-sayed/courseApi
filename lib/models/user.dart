class User {
  int id;
  String firstName, lastName, email, image;
  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
    required this.email,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      image: json['avatar'],
    );
  }
}
