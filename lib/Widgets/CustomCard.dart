import 'package:e_commerce/Pages/Admin/AddProduct.dart';
import 'package:e_commerce/Others/Constants.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  String title, image;
  CustomCard({@required this.title, @required this.image});
  @override
  Widget build(BuildContext context) {
    var heightValue = MediaQuery.of(context).size.height;
    var widthValue = MediaQuery.of(context).size.width;
    return Container(
      height: heightValue * 0.3,
      width: widthValue * 0.45,
      child: InkWell(
        onTap: () {
          switch (title) {
            case "Add Product":
              Navigator.of(context).pushNamed(AddProduct.ID);
              break;
            case "Update Product":
              Navigator.of(context).pushNamed(AddProduct.ID);
              break;
            case "Delete Product":
              Navigator.of(context).pushNamed(AddProduct.ID);
              break;
            case "Product List":
              Navigator.of(context).pushNamed(AddProduct.ID);
              break;
          }
        },
        child: Card(
          elevation: 9.0,
          color: mainColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image(
                height: 75.0,
                image: AssetImage(image),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18.0,
                  fontFamily: yuseiFont,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
