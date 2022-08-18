// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  login() async {
    try {
      googleAccount.value = await googleSignIn.signIn();
      Get.snackbar("Login", "Login Successful");
    } catch (e) {
      Get.snackbar("Login", "Login Failed, Try again");
    }
  }

  logout() async {
    try {
      googleAccount.value = await googleSignIn.signOut();
      Get.snackbar("Login", "LogOut Successful");
    } catch (e) {
      Get.snackbar("Login", "Login Failed, Try again");
    }
  }
}
