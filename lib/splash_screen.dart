import 'package:agri_ecommerce/welcome_screen.dart';
import 'package:flutter/material.dart';

import 'main.dart';
//import 'package:animated_splash_screen/animated_splash_screen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const WelcomeScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                'assets/splash.jpeg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          Opacity(
            opacity: 0.1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff141a39),
              ),
            ),
          ),
          /* const Center(
              child: const CircleAvatar(
            radius: 85,
            backgroundColor: Colors.white,
          )),*/
          /* Center(
              child: Container(
            height: 125,
            width: 130,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                // shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/splash.jpeg',
                  ),
                  //fit: BoxFit.cover,
                )),
          ))*/
        ],
      ),
    );
  }
}
