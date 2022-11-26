class Donation{
  String _name = "";
  String _description= "";
  String _category= "";
  String _registrationDate = "";
  String _detailId = "";
  String _userName = "";

  Donation(name, description, category, registrationDate, detailId, userName){
    this.name = name;
    this.description = description;
    this.category = category;
    this.registrationDate = registrationDate;
    this.detailId = detailId;
    this.userName = userName;
  }

  String get name => _name;
  set name(String newName) => _name = newName;

  String get description => _description;
  set description(String newDescription) => _description = newDescription;

  String get category => _category;
  set category(String newCategory) => _category = newCategory;

  String get registrationDate => _registrationDate;
  set registrationDate(String newRegistrationDate) => _registrationDate = newRegistrationDate;

  String get detailId => _detailId;
  set detailId(String newDetailId) => _detailId = newDetailId;

  String get userName => _userName;
  set userName(String newName) => _userName = newName;


}