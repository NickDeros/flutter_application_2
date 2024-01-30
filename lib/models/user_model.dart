
// ignore_for_file: non_constant_identifier_names

class UserModel {
  String first_name;
  String last_name;
  String email;
  int age;
  String registration_date;
  String uid;

  UserModel({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.age,
    required this.registration_date,
    required this.uid,
  });

  UserModel.fromMap(Map<String, dynamic> userMap)
      : first_name = userMap["first_name"].toString(),
        last_name = userMap["last_name"].toString(),
        email = userMap["email"].toString(),
        age = userMap["age"] as int,
        registration_date = userMap["regitration_date"].toString(),
        uid = userMap["uid"].toString();
}
