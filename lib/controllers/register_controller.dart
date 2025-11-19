import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_12/routes/routes.dart';

class RegisterController extends GetxController {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();

  var isLoading = false.obs;

  final String baseUrl = "https://mediadwi.com/api/latihan/register-user";

  Future<void> register() async {
    isLoading.value = true;

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {
          "username": username.text.trim(),
          "password": password.text.trim(),
          "full_name": fullName.text.trim(),
          "email": email.text.trim(),
        },
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200 && data["status"] == true) {
        Get.snackbar("Sukses", data["message"] ?? "Register berhasil");
        Get.offAllNamed(AppRoutes.loginPage);
      } else {
        Get.snackbar("Gagal", data["message"] ?? "Terjadi kesalahan");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    fullName.dispose();
    email.dispose();
    super.onClose();
  }
}