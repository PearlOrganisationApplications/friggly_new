import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:friggly/app/constants/appcolors.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  CarouselController _carouselController = CarouselController();
  final _key = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              Container(
                height: 500,
                width: MediaQuery.of(context).size.width,
                color: Colors.green,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      return Column(
                        children: [
                          const Text(
                              "dfasdfdfdgfdgsdfgffgdfgfgdfgdgdfgdfgdfgdfgdsfgdsg"),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.45,
                            width: MediaQuery.of(context).size.width * 0.55,
                            decoration: BoxDecoration(
                              color: AppColors.blueZodiacTwo,
                              border: const Border(
                                top: BorderSide(
                                  width: 15.0,
                                  color: Colors.white,
                                ),
                                bottom: BorderSide(
                                  width: 15.0,
                                  color: Colors.white,
                                ),
                                left: BorderSide(
                                  width: 5.0,
                                  color: Colors.white,
                                ),
                                right: BorderSide(
                                  width: 5.0,
                                  color: Colors.white,
                                ),
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2.0,
                                ),
                              ],
                            ),
                            child: CarouselSlider(
                              // key: _key,
                              carouselController: _carouselController,
                              items: [
                                Image.asset('assets/images/heart.png'),
                                Image.asset('assets/images/logo.png')
                              ],
                              options: CarouselOptions(
                                initialPage: 3,
                              ),
                            ),
                          ),
                        ],
                      );
                    })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
