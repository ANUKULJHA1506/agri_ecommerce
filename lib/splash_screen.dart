import 'package:flutter/material.dart';

import 'main.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 25), () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'title')));
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
        ],
      ),
    );
  }
}
