class User {
  String id; // coleccion de firebase
  String username;
  String fullname;
  String email;
  String password;
  String principalInterest;
  String? profilePicture;
  String? uid; // firebase, para el futuro!

  User({
    this.id = '',
    this.profilePicture,
    required this.username,
    required this.fullname,
    required this.email,
    required this.password,
    required this.principalInterest,
    this.uid,
  });

  // nos va a servir para almacenar la informacion en el localstorage
  String toMapString() {
    return """
      {
        "id": "$id",
        "username": "$username",
        "fullname": "$fullname",
        "email": "$email",
        "principalInterest": "$principalInterest",
        "profilePicture": "$profilePicture",
        "uid": "$uid"
      }
      """;
  }

  // convertir de map a instancia de esta clase
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map["id"] ?? '',
      fullname: map["fullname"] ?? '',
      email: map["email"] ?? '',
      password: map["password"] ?? '',
      principalInterest: map["principalInterest"] ?? '',
      profilePicture: map["profilePicture"] ?? '',
      uid: map["uid"] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "username": username,
      "fullname": fullname,
      "email": email,
      "password": password,
      "principalInterest": principalInterest,
      "profilePicture": profilePicture
    };
  }


}
