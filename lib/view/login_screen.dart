import 'package:flutter/material.dart';
import 'package:flutter_google_facebook_auth/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Obx(() {
          if (controller.googleAccount.value == null) {
            return const LoginBtn();
          } else {
            return const Info();
          }
        }),
      ),
    );
  }
}

class Info extends StatelessWidget {
  const Info({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    final userEmail = controller.googleAccount.value?.email ?? "Email";
    final userName = controller.googleAccount.value?.displayName ?? "Name";
    final imageUrl = controller.googleAccount.value?.photoUrl ??
        "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png";

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(
            imageUrl,
          ).image,
          radius: 100,
        ),
        const SizedBox(height: 10),
        Text(userEmail),
        const SizedBox(height: 10),
        Text(userName),
        FloatingActionButton.extended(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          icon: const Icon(
            Icons.logout,
          ),
          onPressed: () {
            controller.logout();
          },
          label: const Text("Login out"),
        ),
      ],
    );
  }
}

class LoginBtn extends StatelessWidget {
  const LoginBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return FloatingActionButton.extended(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      icon: const Icon(
        Icons.g_translate_rounded,
      ),
      onPressed: () {
        controller.login();
      },
      label: const Text("Sign in with google"),
    );
  }
}
