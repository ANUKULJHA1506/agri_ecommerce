import 'dart:async';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/rendering.dart';
import 'package:line_icons/line_icons.dart';



// ignore: camel_case_types
class home_page extends StatefulWidget {
  const home_page({Key? key}) : super(key: key);
  @override
  State<home_page> createState() => _home_pageState();
}




class _home_pageState extends State<home_page> {

   late PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageNo == 4) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }




  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff292D32),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff292D32),
            expandedHeight: 110,
            floating: true,
            pinned: true,
            snap: false,
            centerTitle: false,
            automaticallyImplyLeading: false,

            title: const Text('Agri_Tech'),
            actions: [
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
            ],
            bottom: AppBar(backgroundColor: Color(0xff292D32),
              title: Container(
                width: double.infinity,
                height: 40,
                color: Colors.white,
                child: const Center(
                  child: TextField(
                    decoration: InputDecoration( iconColor:Color(0xff292D32) ,
                        hintText: 'Search for something',
                        prefixIcon: Icon(Icons.search , color: Color(0xff292D32),),
                        suffixIcon: Icon(Icons.camera_alt,color: Color(0xff292D32))),
                  ),
                ),
              ),
            ),
          ),

          // Other Sliver Widgets
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(
                height: 210,
                width: 300,
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    pageNo = index;
                    setState(() {});
                  },
                  itemBuilder: (_, index) {
                    return AnimatedBuilder(
                      animation: pageController,
                      builder: (ctx, child) {
                        return child!;
                      },
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content:
                              Text("Hello you tapped at ${index + 1} "),
                            ),
                          );
                        },
                        onPanDown: (d) {
                          carasouelTmer?.cancel();
                          carasouelTmer = null;
                        },
                        onPanCancel: () {
                          carasouelTmer = getTimer();
                        },
                        child: Container(
                          margin: const EdgeInsets.only(
                              right: 8, left: 8, top: 5, bottom: 12),
                          decoration: BoxDecoration(
                            color: Color(0xffA9DFD8),
                            image: const DecorationImage(
                                image: AssetImage("assets/mask_group.png"),
                                fit: BoxFit.cover),

                            borderRadius: BorderRadius.circular(25.0),
                            //color: const Color(0xffFF6933),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                      (index) => GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 2.0,
                        left: 5,
                      ),
                      child: Icon(
                        Icons.circle,
                        size: 10.0,
                        color: pageNo == index
                            ? const Color(0xffA9DFD8)
                            : const Color(0xff8f9586),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                height: 1000,
                color: Color(0xff292D32),

              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: Container(
      decoration: BoxDecoration(
      color: Color(0xff292D32),
      boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(.1),
        )
      ],
    ),
    child: SafeArea(
    child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
    child: GNav(
    rippleColor: Colors.grey[300]!,
    hoverColor: Colors.grey[300]!,
    gap: 8,
    activeColor: Colors.black,
    iconSize: 24,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    duration: Duration(milliseconds: 400),
    tabBackgroundColor: Color(0xffA9DFD8),
    color: Colors.grey[100]!,
    tabs: const [
    GButton(
    icon: LineIcons.home,
    text: 'Home',
    ),
    GButton(
    icon: LineIcons.amazonPay,
    text: 'Payment',
    ),
    GButton(
    icon: LineIcons.percentage,
    text: 'Cashback',
    ),
    GButton(
    icon: LineIcons.user,
    text: 'Profile',
    ),
    ],

    ),
    ),))
    );
  }
}




