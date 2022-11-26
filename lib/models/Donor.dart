class Donor{
  String _name = "";
  String _document= "";
  String _address = "";
  String _photo = "";

  Donor({name, document, address, photo});

  String get name => _name;
  set name(String newName) => _name = newName;

  String get document => _document;
  set lastname(String newDocument) => _document = newDocument;

  String get address => _address;
  set address(String newAddress) => _address = newAddress;

  String get photo => _photo;
  set photo(String newPhoto) => _photo = newPhoto;
}