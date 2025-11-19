import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/authentification_controller.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_button.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final controller = Get.find<AuthentificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Login Page",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  label: "Username",
                  prefixIcon: Icon(Icons.person),
                  controller: controller.username,
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  label: "Password",
                  prefixIcon: Icon(Icons.password),
                  obscureText: true,
                  controller: controller.password,
                ),
                SizedBox(height: 20),
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : CustomButton(
                          text: "Login",
                          textcolor: AppColor.neutrallight,
                          backgroundcolor: AppColor.primaryblue,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Register",
                  textcolor: AppColor.primaryblue,
                  backgroundcolor: AppColor.neutrallight,
                  onPressed: () {
                    Get.toNamed(AppRoutes.registerPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}