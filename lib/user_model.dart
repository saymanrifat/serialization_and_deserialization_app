class UserModel {
  late String id;
  late String fullName;
  late String email;

  UserModel({required this.id, required this.fullName, required this.email});

  //Map to Object
  UserModel.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.fullName = map["fullName"];
    this.email = map["email"];
  }

//Object to Map
  Map<String, dynamic> toMap() {
    return {
      "id": this.id,
      "fullName": this.fullName,
      "email": this.email,
    };
  }
}
