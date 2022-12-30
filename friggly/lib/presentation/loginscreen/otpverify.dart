import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:friggly/contacts/calllogs.dart';
import 'package:friggly/presentation/homescreen/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../app/constants/appcolors.dart';

class VerifyOtp extends StatefulWidget {
  const VerifyOtp({super.key});

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Column(
              children: [
                const SizedBox(
                  height: 150.0,
                ),
                Text(
                  "Enter Your Code",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: GoogleFonts.comfortaa().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Expanded(
                    child: OtpTextField(
                      fieldWidth: 50.0,
                      numberOfFields: 5,
                      showFieldAsBox: true,
                      showCursor: false,
                      borderColor: AppColors.themeColor,
                      focusedBorderColor: AppColors.themeColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CallLogspage(),
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
                      "Verify OTP",
                      style: TextStyle(
                        fontFamily: GoogleFonts.comfortaa().fontFamily,
                        color: AppColors.greyColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                          fontFamily: GoogleFonts.comfortaa().fontFamily,
                          color: AppColors.themeColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Clear all",
                        style: TextStyle(
                          fontFamily: GoogleFonts.comfortaa().fontFamily,
                          color: AppColors.themeColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
