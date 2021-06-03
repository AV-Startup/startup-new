class User {
  final String id;
  final String fullName;
  final String email;
  final String userRole;
  String about;
  final String phone;
  final String countryCode;

  User(
      {this.id,
      this.fullName,
      this.email,
      this.userRole,
      this.about,
      this.phone,
      this.countryCode});

  User.fromData(Map<String, dynamic> data)
      : id = data['id'],
        about = data['about'],
        phone = data['phone'],
        fullName = data['fullName'],
        email = data['email'],
        countryCode = data['countryCode'],
        userRole = data['userRole'];

  User.fromRTDBData(Map<dynamic, dynamic> data)
      : id = data['id'],
        about = data['about'],
        phone = data['phone'],
        fullName = data['fullName'],
        email = data['email'],
        countryCode = data['countryCode'],
        userRole = data['userRole'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'userRole': userRole,
      'about': about,
      'countryCode': countryCode,
      'phone': phone
    };
  }
}
