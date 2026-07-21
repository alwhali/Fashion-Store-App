import 'package:fashion_store_app/model/model.dart';
import 'package:fashion_store_app/screens/categories_screen.dart';
import 'package:fashion_store_app/widget.dart/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/video1.mp4")
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        leading: SvgPicture.asset("assets/svg/bar-chart-2.svg"),
        title: Text(
          "Runway",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        trailing: SvgPicture.asset(
          "assets/svg/solar_bell.svg",
          height: 24,
          width: 24,
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              //we remove 56 from height because of the appbar is hight is 56
              height: MediaQuery.of(context).size.height - 56 + 10,
              width: double.infinity,
              child: Stack(
                children: [
                  //video player
                  _controller.value.isInitialized
                      ? SizedBox(
                          height: 500,
                          width: 430,
                          child: AspectRatio(
                            //this line is specificed thke height and width of the video
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          ),
                        )
                      : Container(),

                  // Categories
                  Positioned(
                    top: 500,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            height: 54,
                            width: double.infinity,
                            child: Row(
                              children: [
                                Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            height: 127,
                            width: double.infinity,
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: categories.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryWidget(
                                  categoryName: categories[index].name,
                                  categoryImage: categories[index].image,
                                  ontap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CategoriesScreen(
                                        categoryName: categories[index].name,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // navbottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.only(left: 30, right: 30, top: 15),
              height: 90,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: Colors.black, width: 0.5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavBarElement(text: "Home", icon: Icons.home_rounded),
                  NavBarElement(text: "Likes", icon: Icons.favorite_border),
                  NavBarElement(text: "Bag", icon: Icons.shopping_bag_outlined),
                  NavBarElement(text: "Home", icon: Icons.person_2_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBarElement extends StatelessWidget {
  NavBarElement({super.key, required this.text, required this.icon});
  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 34),
        // SizedBox(height: 3),
        Text(text, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
      ],
    );
  }
}

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.categoryName,
    required this.categoryImage,
    this.ontap,
  });
  String categoryName;
  String categoryImage;
  Function()? ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.all(10),
        height: 127,
        width: 95,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 75,
              width: 75,
              child: CircleAvatar(backgroundImage: AssetImage(categoryImage)),
            ),
            SizedBox(height: 5),
            Text(
              categoryName,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget myAppBar({
  required Widget leading,
  required Widget title,
  required Widget trailing,
}) {
  return AppBar(
    leading: Container(
      padding: EdgeInsets.only(left: 10),
      height: 24,
      width: 24,
      child: leading,
    ),
    leadingWidth: 40,

    title: title,
    centerTitle: true,

    actions: [trailing, SizedBox(width: 10)],
  );
}
