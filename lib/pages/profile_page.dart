import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_12/controllers/authentification_controller.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_color.dart';
import 'package:pas_mobile_11pplg2_12/reusable components/custom_button.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  final controller = Get.find<AuthentificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          elevation: 6,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://cdn.kyou.id/items/368798-blue-archive-chocopuni-plushie-sunaookami-shiroko-17cm.jpg.webp",
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Diogenes Damian Chrisnanda",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.primarydark,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "diogenesdamianchrisnanda@gmail.com",
                  style: TextStyle(fontSize: 16, color: AppColor.primarydark),
                ),

                SizedBox(height: 25),

                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                    text: "Logout",
                    backgroundcolor: AppColor.secondaryred,
                    textcolor: AppColor.neutrallight,
                    onPressed: () {
                      Get.dialog(
                        AlertDialog(
                          title: Text("Konfirmasi Logout"),
                          content: Text("Anda yakin ingin logout?"),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              child: Text("Tidak"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.logout();
                              },
                              child: Text("Ya"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}