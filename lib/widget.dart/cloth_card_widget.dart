import 'package:fashion_store_app/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ClothCardWidget extends StatelessWidget {
  ClothCardWidget({
    super.key,
    required this.nameCategory,
    required this.pathImage,
    required this.description,
    required this.price,
    required this.isFavorite,
  });
  String nameCategory;
  String pathImage;
  String description;
  int price;
  bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Details(
            nameCategory: nameCategory,
            image: pathImage,
            description: description,
            price: price,
            isFavorite: isFavorite,
          ),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: 312,
        width: 200,
        child: Column(
          children: [
            Container(
              height: 255,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffECECEC),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Stack(
                  children: [
                    Container(
                      height: 244,

                      child: Image.asset(pathImage, fit: BoxFit.cover),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: SvgPicture.asset(
                        "assets/svg/shadowUnderModel.svg",
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "£ $price",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                        width: 18,
                        child: isFavorite
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite_border, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
