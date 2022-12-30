import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:friggly/app/constants/appcolors.dart';
import 'package:friggly/contacts/contact.dart';
import 'package:friggly/presentation/loginscreen/otpverify.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200.0),
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, right: 15.0),
                          child: Card(
                            elevation: 5.0,
                            color: AppColors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: AppColors.shedowgreyColor, width: 2.0),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: TextField(
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    hintText: "Enter your mobile no.",
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifyOtp(),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50.0,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: AppColors.themeColor,
                              // border:
                              //     Border.all(width: 2.0, color: Colors.grey),
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shedowgreyColor,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Text(
                              "Send SMS",
                              style: TextStyle(
                                //fontFamily: GoogleFonts.comfortaa().fontFamily,
                                color: AppColors.greyColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Text(
                            "Or",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContactList()));
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shedowgreyColor,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/Facebooklogo.png',
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                Text(
                                  "Sign Up With Facebook",
                                  style: TextStyle(
                                    // fontFamily:
                                    //     GoogleFonts.comfortaa().fontFamily,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.greyColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40.0,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.85,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.shedowgreyColor,
                                  blurRadius: 8.0,
                                  spreadRadius: 2.5,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(
                                  'assets/images/googlelogo.png',
                                  height: 30.0,
                                  width: 30.0,
                                ),
                                Text(
                                  "Sign Up With Google",
                                  style: TextStyle(
                                    // fontFamily:
                                    // GoogleFonts.comfortaa().fontFamily,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.greyColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
