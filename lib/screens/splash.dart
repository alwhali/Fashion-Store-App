import 'package:fashion_store_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int durationOfSplashInSeconds = 1;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: durationOfSplashInSeconds + 1), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 58,
              width: 188,
              child: SvgPicture.asset("assets/svg/Runway.svg"),
            ),
            SizedBox(height: 5),

            TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: durationOfSplashInSeconds),
              builder: (context, value, child) {
                return ClipRRect(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: value,
                    child: child,
                  ),
                );
              },
              child: SizedBox(
                height: 16.47,
                width: 189,
                child: SvgPicture.asset("assets/svg/Rectangle9.svg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
