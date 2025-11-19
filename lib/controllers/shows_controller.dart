import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_12/models/shows_model.dart';

class TableShow extends GetxController{
  var isLoading = false.obs;
  var tableStandings = <Shows>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchAPITableShow();
  }
  
  void fetchAPITableShow() async{
    const url = "https://api.tvmaze.com/shows";
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse(url));
      print("Status code : " + response.statusCode.toString());
      print("Json response : " + response.body.toString());

      if(response.statusCode == 200){
        final data = jsonDecode(response.body);
        final List standings = data;
        tableStandings.assignAll(
        standings.map((e) => Shows.fromJson(e)).toList(),);
      }
      else{
        Get.snackbar("Error", "Message error dari BE");
      }

    } catch (e) {
        Get.snackbar("Error", e.toString());
    }
      isLoading.value = false;

  }

}