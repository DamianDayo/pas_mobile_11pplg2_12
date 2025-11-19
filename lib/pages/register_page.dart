import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/authentification_controller.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_button.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_textfield.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
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
                  "Register Page",
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
                SizedBox(height: 15),
                CustomTextfield(
                  label: "Nama Lengkap",
                  prefixIcon: Icon(Icons.person),
                  controller: controller.fullName,
                ),
                SizedBox(height: 15),
                CustomTextfield(
                  label: "Email",
                  prefixIcon: Icon(Icons.email),
                  controller: controller.email,
                ),
                SizedBox(height: 20),
                CustomButton(
                  text: "Register",
                  backgroundcolor: AppColor.primaryblue,
                  textcolor: AppColor.neutrallight,
                  onPressed: () {
                    controller.register();
                  },
                ),
                SizedBox(height: 15),
                CustomButton(
                  text: "Login",
                  backgroundcolor: AppColor.neutrallight,
                  textcolor: AppColor.primaryblue,
                  onPressed: () {
                    Get.toNamed(AppRoutes.loginPage);
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