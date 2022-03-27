import 'package:flutter/material.dart';
import 'package:shamo/core/utility/theme_helper.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Center(
        child: Container(
          width: 130,
          height: 150,
          decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage('assets/image_splash.png')),
          ),
        ),
      ),
    );
  }
}
