class ProductModel {
  String _name,_id,_image,_description ;
  double _price ;

  ProductModel(this._name, this._id, this._image, this._price,this._description);
  ProductModel.fromMap(Map<String,dynamic> data) {
    _id = data["id"] ;
    _name = data["name"] ;
    _price = data["price"] ;
    _image = data["image"] ;
    _description = data["description"];
  }

  Map<String,dynamic> toMap() => {
    "id":_id ,
    "name":_name ,
    "price":_price ,
    "image":_image ,
    "description":_description ,
  };


  get description => _description;

  set setDescription(value) {
    _description = value;
  }

  double get price => _price;

  set setPrice(double value) {
    _price = value;
  }

  get image => _image;

  set setImage(value) {
    _image = value;
  }

  get id => _id;

  set setId(value) {
    _id = value;
  }

  String get name => _name;

  set setName(String value) {
    _name = value;
  }
}