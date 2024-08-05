

import "package:dio/dio.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:google_sign_in/google_sign_in.dart";



class GlobalVariables {
  static _App app = _App();
  static _Firebase firebase = _Firebase();
}

class _App {
  late Dio client;
  bool restartRequired = false;
}

class _Firebase {

  // Firebase
  GoogleSignIn googleSign = GoogleSignIn();
  FirebaseAuth auth = FirebaseAuth.instance;

}
