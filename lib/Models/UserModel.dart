class UserModel {
  String _name,_email,_password,_id ;

  UserModel(this._email, this._password);
  UserModel.nameEmailPass(this._name, this._email, this._password);
  UserModel.allWithId(this._name, this._email, this._id);


  UserModel.fromMap(Map<String,dynamic> data){
    _id = data["id"] ;
    _name = data["name"];
    _email = data["email"] ;
  }

  Map<String,dynamic> toMap()=>{
    "id":_id ,
    "name":_name ,
    "email":_email ,
  };

  get id => _id;

  set id(value) {
    _id = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  String get name => _name;

  set setName(String value) {
    _name = value;
  }
}