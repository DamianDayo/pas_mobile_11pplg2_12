import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_12/models/login_model.dart';
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isApiLoading = false.obs;

  LoginModel? loginModel;

  final String baseUrl = "https://mediadwi.com/api/latihan/login";

  Future<void> login() async {
    isApiLoading.value = true;

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password},
      );

      print("=== RESPONSE BODY ===");
      print(response.body);

      final data = jsonDecode(response.body);
      loginModel = LoginModel.fromJson(data);

      if (response.statusCode == 200 && (loginModel?.status ?? false)) {
        final prefs = await SharedPreferences.getInstance();

        if (loginModel?.token != null && loginModel!.token!.isNotEmpty) {
          await prefs.setString('token', loginModel!.token!);
        }

        await prefs.setString('username', username);
        await prefs.setString('email', "$username@example.com");
        await prefs.setBool('isLoggedIn', true);

        Get.snackbar("Login Berhasil", loginModel?.message ?? '');
        Get.offAllNamed(AppRoutes.mainMenuPage);
      } else {
        Get.snackbar("Login Gagal", loginModel?.message ?? "Terjadi kesalahan");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isApiLoading.value = false;
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}