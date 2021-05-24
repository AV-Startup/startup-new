class User {
  final String id;
  String name;
  final String email;
  final String userRole;
  String about;
  final String phone;
  final String countryCode;

  User(
      {this.id,
      this.name,
      this.email,
      this.userRole,
      this.about,
      this.phone,
      this.countryCode});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        about = data['about'],
        phone = data['phone'],
        name = data['name'],
        email = data['email'],
        countryCode = data['countryCode'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': name,
      'email': email,
      'userRole': userRole,
      'about': about,
      'countryCode': countryCode,
      'phone': phone
    };
  }
}
