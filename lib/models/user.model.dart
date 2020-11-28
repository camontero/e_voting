class UserModel {

  String password;
  String email;
  String name;
  String lastname;
  String dniType;
  String dniNumber;
  String telType;
  String telNumber;


  UserModel({
    this.name,
    this.lastname,
    this.email,
    this.password,
    this.dniType,
    this.dniNumber,
    this.telType,
    this.telNumber,
  });
}