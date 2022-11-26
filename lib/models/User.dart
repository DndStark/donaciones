class User{
  String _email = "";
  String _password= "";

  User({name, document, address, photo});

  String get email => _email;
  set name(String newEmail) => _email = newEmail;

  String get password => _password;
  set lastname(String newPassword) => _password = newPassword;
}