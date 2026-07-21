import 'package:flutter/foundation.dart';

class CategoryModel {
  String name;
  String image;
  CategoryModel(this.name, this.image);
}

List<CategoryModel> categories = [
  CategoryModel("Men", "assets/png/categories/man.png"),
  CategoryModel("Women", "assets/png/categories/woman.png"),
  CategoryModel("Kids", "assets/png/categories/kids.png"),
  CategoryModel("Home", "assets/png/categories/Home.png"),
  CategoryModel("Deals", "assets/png/categories/deals.png"),
];

class ClothModel {
  String name;
  String image;
  String description;
  int price;
  bool isFavorite;
  ClothModel(
    this.name,
    this.image,
    this.description,
    this.price,
    this.isFavorite,
  );
}

List<ClothModel> cloths = [
  ClothModel(
    "Gray Coat",
    "assets/png/cloths/cloth1.png",
    "Gray coat and white T-sh..",
    10,
    true,
  ),
  ClothModel(
    "Gray Coat",
    "assets/png/cloths/cloth2.png",
    "Gray coat and white T-sh..",
    10,
    true,
  ),
  ClothModel(
    "Gray Coat",
    "assets/png/cloths/cloth3.png",
    "Gray coat and white T-sh..",
    10,
    false,
  ),
  ClothModel(
    "Gray Coat",
    "assets/png/cloths/cloth4.png",
    "Gray coat and white T-sh..",
    10,
    false,
  ),
  ClothModel(
    "White Coat",
    "assets/png/cloths/cloth5.png",
    "Gray coat and white T-sh..",
    10,
    false,
  ),
  ClothModel(
    "White Coat",
    "assets/png/cloths/cloth6.png",
    "Gray coat and white T-sh..",
    10,
    true,
  ),
];
