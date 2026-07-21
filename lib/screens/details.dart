import 'package:fashion_store_app/widget.dart/custom_appbar.dart';
import 'package:fashion_store_app/widget.dart/tool_barWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Details extends StatefulWidget {
  Details({
    super.key,
    required this.nameCategory,
    required this.image,
    required this.description,
    required this.price,
    this.isFavorite = false,
  });
  String nameCategory;
  String image;
  String description;
  int price;
  bool isFavorite;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  ScrollController myScrollController = ScrollController();
  Future<dynamic> showBottomSheet() {
    return showModalBottomSheet(
      useSafeArea: true,
      // isScrollControlled: true,
      // enableDrag: true,
      backgroundColor: Color(0xffECECEC),
      barrierColor: Colors.transparent,
      context: context,

      builder: (BuildContext context) {
        return MyBottomSheet(
          scrollController: myScrollController,
          widget: widget,
        );
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBottomSheet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
        title: Text(
          widget.nameCategory,
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
          SizedBox(height: 20),

          //image of cloth
          Stack(
            children: [
              SizedBox(
                height: 500,
                width: 250,
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.fitHeight,
                  // color: Color(0xffECECEC),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset("assets/svg/shadowUnderModel.svg"),
              ),
            ],
          ),
          // Expanded(
          //   child: MyBottomSheet(
          //     draggableScrollableController: draggableScrollableController,
          //     widget: widget,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  MyBottomSheet({
    super.key,
    required this.scrollController,
    required this.widget,
  });
  ScrollController scrollController;
  final Details widget;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.33,
      minChildSize: 0.33,
      maxChildSize: 1,
      shouldCloseOnMinExtent: false,

      expand: false,
      // snap: true,
      builder: (context, scrollController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    height: 6,
                    width: 42,
                    decoration: BoxDecoration(
                      color: Color(0xffD9D9D9),
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),
              ListView(
                controller: scrollController,
                children: [
                  // the mark of bottom sheet
                  SizedBox(height: 20),
                  //description
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 45,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  // price and likes
                  Container(
                    alignment: Alignment.centerLeft,

                    height: 51,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "£ ${widget.price}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            widget.isFavorite
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                    size: 20,
                                  )
                                : Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                            SizedBox(width: 10),
                            Text(
                              "450 Likes",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //select color and size
                  Container(
                    height: 55,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Select color",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down, size: 14),
                          ],
                        ),

                        Container(color: Colors.black, width: 1, height: 20),
                        Row(
                          children: [
                            Text(
                              "Select size",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_drop_down, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

                  //button add to cart
                  Container(
                    height: 55,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Add to BAG".toUpperCase(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),

                  //free delivery and free return
                  Container(
                    // height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyListTileInBottomSheet(
                          icon: "assets/svg/solar_delivery-linear.svg",
                          title: "Free delivery",
                        ),

                        Divider(),
                        MyListTileInBottomSheet(
                          icon: "assets/svg/hugeicons_truck-return.svg",
                          title: "Free return",
                          trailing: Text(
                            "View return policy",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff999797),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  //About Product
                  Container(
                    height: 39,
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "About Product",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  //list of product details , brand, size, color, history
                  Container(
                    // height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MyListTileInBottomSheet(
                          icon: "assets/svg/productDetails.svg",
                          title: "Product Details",
                          trailing: SvgPicture.asset(
                            "assets/svg/chevron-up.svg",
                          ),
                        ),

                        Divider(),
                        MyListTileInBottomSheet(
                          icon: "assets/svg/brand.svg",
                          title: "Brand",
                          trailing: SvgPicture.asset(
                            "assets/svg/chevron-down.svg",
                          ),
                        ),
                        Divider(),

                        MyListTileInBottomSheet(
                          icon: "assets/svg/sizeAndFit.svg",
                          title: "Size and fit",
                          trailing: SvgPicture.asset(
                            "assets/svg/chevron-down.svg",
                          ),
                        ),
                        Divider(),

                        MyListTileInBottomSheet(
                          icon: "assets/svg/solar_history-outline.svg",
                          title: "History",
                          trailing: SvgPicture.asset(
                            "assets/svg/chevron-down.svg",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class MyListTileInBottomSheet extends StatelessWidget {
  MyListTileInBottomSheet({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
  });
  String icon;
  String title;
  Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon, height: 24, width: 24),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Spacer(),
          trailing ?? SizedBox(),
        ],
      ),
    );
  }
}
