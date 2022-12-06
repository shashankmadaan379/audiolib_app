import 'package:flutter/material.dart';

import '../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
    this.welcome_image = "assets/images/welcome_image.png",
  }) : super(key: key);
  final String welcome_image;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Welcome To AudioLib",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
        ),
        SizedBox(height: defaultPadding * 2),
        Row(
          children: [
            Spacer(),
            Expanded(flex: 30, child: Image.asset(welcome_image)),
            Spacer(),
          ],
        ),
        SizedBox(height: defaultPadding * 2),
      ],
    );
  }
}
