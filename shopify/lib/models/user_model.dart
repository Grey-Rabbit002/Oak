// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String email;
  String uid;
  UserModel({
    required this.name,
    required this.email,
    required this.uid,
  });

  factory UserModel.fromMap(Map<String,dynamic> map)
  {
    return UserModel(
      name: map['name']??'',
      email: map['email']??'',
      uid: map['uid']??'',
    );
  }
  Map<String,dynamic> toMap(){
    return {
      'name': name,
      'email': email,
      'uid': uid,
    };
  }
}
