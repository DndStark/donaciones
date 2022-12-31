class Donation{
  String _donation_name = "";
  String _donation_description= "";
  String _donation_photo = "";
  int _user = 1;
  int _category= 1;
  int _detail = 1;
  int _campaign = 3;

  Donation(String name, String description, String photo, int userName, int category, int detailId, int campaign){
    this._donation_name = name;
    this._donation_description = description;
    this._donation_photo = photo;
    this._user = userName;
    this._category = category;
    this._detail = detailId;
    this._campaign = campaign;
  }

  String get name => _donation_name;
  set name(String newName) => _donation_name = newName;

  String get description => _donation_description;
  set description(String newDescription) => _donation_description = newDescription;

  String get photo => _donation_photo;
  set photo(String newPhoto) => _donation_photo = newPhoto;

  Map<String, dynamic> toJson() => {
    'donation_name': _donation_name,
    'donation_description': _donation_description,
    'donation_photo': _donation_photo,
    'user': _user,
    'category': _category,
    'detail': _detail,
    'campaign': _campaign,
  };
}