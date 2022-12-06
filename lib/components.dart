import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.top_image = "assets/images/top_image.png",
    this.bottom_image = "assets/images/bottom_image.png",
  }) : super(key: key);

  final String top_image, bottom_image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                top_image,
                width: 120,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset(bottom_image, width: 120),
            ),
            SafeArea(child: child),
          ],
        ),
      ),
    );
  }
}
