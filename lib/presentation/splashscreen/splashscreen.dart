import 'dart:async';
import 'package:cache_manager/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:friggly/app/constants/appcolors.dart';
import 'package:friggly/app/constants/appkeys.dart';
import 'package:friggly/presentation/homescreen/homepage.dart';
import 'package:friggly/presentation/loginscreen/loginpage.dart';
import 'package:friggly/presentation/onboarding/onboardingscreen.dart';

class SplasScreen extends StatefulWidget {
  const SplasScreen({super.key});

  @override
  State<SplasScreen> createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  Future _initiateCache() async {
    return CacheManagerUtils.conditionalCache(
        key: AppKeys.userData,
        valueType: ValueType.StringValue,
        actionIfNull: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => OnBoardingScreen(),
            ),
          ).whenComplete(() => {
                WriteCache.setString(
                    key: AppKeys.onBoardDone, value: 'something')
              });
        },
        actionIfNotNull: () {
          CacheManagerUtils.conditionalCache(
              key: AppKeys.userData,
              valueType: ValueType.StringValue,
              actionIfNull: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
              actionIfNotNull: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              });
        });
  }

  @override
  void initState() {
    Timer(const Duration(seconds: 3000), _initiateCache);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF35BAA5),
                  Color(0xFF75EB9F),
                  Color(0xFF35BAA5),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    //color: Colors.white,
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/logo.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 150.0,
                ),
                const SizedBox(
                  height: 150.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Made With ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        image: DecorationImage(
                          image: AssetImage('assets/images/heart.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "in India ",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
