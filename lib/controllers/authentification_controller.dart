import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/models/login_model.dart';
import 'package:pas_mobile_11pplg2_12/models/register_model.dart';
import 'package:pas_mobile_11pplg2_12/api/api.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthentificationController extends GetxController {
  final username = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final email = TextEditingController();

  var loginResponse = Rxn<LoginModel>();
  var registerResponse = Rxn<RegisterModel>();
  var isLoading = false.obs;

  void login() async {
    final usernameToString = username.text.trim();
    final passwordToString = password.text.trim();
    print("Username : ${usernameToString}");
    print("Password : ${passwordToString}");

    final url = Uri.parse("${Api.BASE_URL}/api/latihan/login");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {"username": usernameToString, "password": passwordToString},
      );

      if (res.statusCode == 200) {
        final LoginModel loginModel = loginModelFromJson(res.body);
        loginResponse.value = loginModel;
        print("Login status : ${loginModel.status}");
        if (loginModel.status == true) {
          final pref = await SharedPreferences.getInstance();
          pref.setString("token", loginModel.token.toString());

          Get.snackbar(
            "Login Page",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondarygreen,
            colorText: AppColor.neutrallight,
          );

          Get.offNamed(AppRoutes.mainMenuPage);
        } else {
          Get.snackbar(
            "Authentification",
            loginModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondaryred,
            colorText: AppColor.neutrallight,
          );
        }
      } else {
        Get.snackbar(
          "Login Page",
          "Login Gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Login Page",
        "Koneksi gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void register() async {
    final usernameTs = username.text.trim();
    final passwordTs = password.text.trim();
    final fullNameTs = fullName.text.trim();
    final emailTs = email.text.trim();

    final url = Uri.parse("${Api.BASE_URL}/api/latihan/register-user");

    try {
      isLoading.value = true;

      final res = await http.post(
        url,
        body: {
          "username": usernameTs,
          "password": passwordTs,
          "full_name": fullNameTs,
          "email": emailTs,
        },
      );

      if (res.statusCode == 200) {
        final RegisterModel registerModel = registerModelFromJson(res.body);
        registerResponse.value = registerModel;

        if (registerModel.status == true) {
          Get.snackbar(
            "Register Page",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondarygreen,
            colorText: AppColor.neutrallight,
          );

          username.clear();
          password.clear();
          isLoading.value = false;
          Get.offNamed(AppRoutes.loginPage);
        } else {
          Get.snackbar(
            "Register Page",
            registerModel.message,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: AppColor.secondaryred,
            colorText: AppColor.neutrallight,
          );
        }
      } else {
        Get.snackbar(
          "Register Page",
          "Register gagal: Status ${res.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.secondaryred,
          colorText: AppColor.neutrallight,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Register Page",
        "Koneksi gagal",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.secondaryred,
        colorText: AppColor.neutrallight,
      );
      print("Error Login: $e");
    } finally {
      isLoading.value == false;
    }
  }

  void logout() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove("token");
    Get.snackbar(
      "Informasi",
      "Logout sukses",
      backgroundColor: AppColor.secondarygreen,
      colorText: AppColor.neutrallight,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
    Get.offAllNamed(AppRoutes.loginPage);
  }
}