import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInApi {
  static GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );
  static Future<GoogleSignInAccount?> login() => googleSignIn.signIn();

  static Future signIn({required BuildContext context}) async {
    final user = GoogleSignInApi.login();
    print(user);
    // if (user == null) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomePage(),
    //     ),
    //   );
    // }
  }
}
