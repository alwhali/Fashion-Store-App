import 'package:fashion_store_app/model/model.dart';
import 'package:fashion_store_app/widget.dart/cloth_card_widget.dart';
import 'package:fashion_store_app/widget.dart/custom_appbar.dart';
import 'package:fashion_store_app/widget.dart/tool_barWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key, required this.categoryName});
  String categoryName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          categoryName,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        trailing: Stack(
          children: [
            SvgPicture.asset("assets/svg/bagShop.svg", height: 24, width: 24),
            Positioned(
              top: 0,
              right: 0,

              child: Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "5",
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          ToolBarWidget(),
          //we can here use expanded to make the gridview full screen
          // or we can use SizedBox with height and width below
          Expanded(
            //we remove 56 from height because of the appbar is hight is 56
            //and remove  52 is the height of the toolbar
            //and 55 is the height of the bottomnav
            // height: MediaQuery.of(context).size.height - 56 - 52 - 55,

            // width: double.infinity,
            child: GridView.builder(
              // padding: EdgeInsets.only(top: 5, bottom: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                // we but mainAxisExtent to 322 because hight of the card is 312
                //and there is padding vertical 10 top and 10 bottom
                //then 312+ 10 + 10 = 322
                mainAxisExtent: 332,
                crossAxisCount: 2,
              ),
              itemCount: cloths.length,
              itemBuilder: (context, index) {
                return ClothCardWidget(
                  nameCategory: categoryName,
                  pathImage: cloths[index].image,
                  description: cloths[index].description,
                  price: cloths[index].price,
                  isFavorite: cloths[index].isFavorite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
