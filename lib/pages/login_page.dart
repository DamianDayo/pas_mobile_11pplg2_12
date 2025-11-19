import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_button.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_12/controllers/login_controller.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller = Get.find<LoginController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextfield(
              label: "Username",
              controller: controller.usernameController,
            ),

            CustomTextfield(
              label: "Password",
              controller: controller.passwordController,
              obscureText: true,
            ),

            const SizedBox(height: 24),

            Obx(() {
              return controller.isApiLoading.value
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: "Login",
                      textcolor: Colors.black,
                      onPressed: controller.login,
                    );
            }),

            const SizedBox(height: 20),

            const Row(
              children: [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("Belum punya akun?"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            CustomButton(
              text: "Register",
              textcolor: Colors.black,
              onPressed: () {
                Get.toNamed(AppRoutes.registerPage);
              },
            ),
          ],
        ),
      ),
    );
  }
}