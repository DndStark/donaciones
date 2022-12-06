import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Authenticator{

  static Future<User?> initSession({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    GoogleSignIn google = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await google.signIn();

    if(googleSignInAccount != null){
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );

      try{
        UserCredential userCredential = await auth.signInWithCredential(credential);
        user = userCredential.user;
        return user;

      } on FirebaseAuthException catch(e){
        print("Error en la autenticación");
      }
    }
  }

  static Future<User?> initSessionFacebook({required BuildContext context}) async {
    FacebookAuth facebook = FacebookAuth.instance;
    User? user;
    //final LoginResult loginResult = await FacebookAuth.instance.login();

    facebook.login(
      permissions: ["public_profile", "email"]
    ).then((value) =>
        facebook.getUserData().then((userData) {
          print(userData);
          return userData;
        })
    );

    //final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken.0.0token);





  }
}