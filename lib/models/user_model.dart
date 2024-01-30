
class UserModel {
  String firstName;
  String lastName;
  String email;
  int age;
  String regDate;
  String uid;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.age,
    required this.regDate,
    required this.uid,
  });

  UserModel.fromMap(Map<String, dynamic> userMap)
      : firstName = userMap["firstName"],
        lastName = userMap["lastName"],
        email = userMap["email"],
        age = userMap["age"],
        regDate = userMap["regDate"],
        uid = userMap["uid"];
}
