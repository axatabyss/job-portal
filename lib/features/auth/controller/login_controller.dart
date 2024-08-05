


import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:job_portal/core/utils/global_variables.dart';
import 'package:job_portal/core/utils/no_connection_widget.dart';
import 'package:job_portal/features/auth/view/login_view.dart';
import 'package:job_portal/features/company/binding/company_binding.dart';
import 'package:job_portal/features/company/view/company_view.dart';
import 'package:shared_preferences/shared_preferences.dart';



class LoginController extends GetxController {

  static LoginController instance = Get.find();

  late Rx<GoogleSignInAccount?> googleSignInAccount;

  Future<bool> _connectivityCheck() async {
    if (await Connectivity().checkConnectivity() != ConnectivityResult.none) {
      return true;
    } else {
      await Get.to(
        () => const NoConnectionWidget(
          restartRequired: true,
        ),
      );
      return false;
    }
  }

  @override
  void onInit() async {
    super.onInit();

    googleSignInAccount = Rx<GoogleSignInAccount?>(GlobalVariables.firebase.googleSign.currentUser);
    googleSignInAccount.bindStream(GlobalVariables.firebase.googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);

  }



  @override
  Future<void> onReady() async {
    super.onReady();
    final bool isConnected = await _connectivityCheck();
    if (GlobalVariables.app.restartRequired || !isConnected) {
      await Get.to(
        () => const NoConnectionWidget(
          restartRequired: true,
        ),
      );
    }

    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? authID = sp.getString('authID');

    if (authID != null) {
      await Get.offAll(() => const CompanyView(), binding: CompanyViewBinding());
    }

  }


  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) async {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      Get.offAll(() => const LoginView());
    } else {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('authID', googleSignInAccount.id);
      Get.offAll(() => const CompanyView());
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await GlobalVariables.firebase.googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        await GlobalVariables.firebase.auth
            .signInWithCredential(credential)
            .catchError((onErr) => print(onErr));
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM);
      print(e.toString());
    }
  }

  void signOut() async {
    await GlobalVariables.firebase.auth.signOut();
  }

}





