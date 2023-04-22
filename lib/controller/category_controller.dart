import 'dart:convert';

import '../database.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Yoga_model.dart';

class CathController extends GetxController {
  RxList<YogaModel> yogaModels = <YogaModel>[].obs;
  RxInt amount = 1.obs;

  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  void addItem(YogaModel? yogaModel, int value) {
    amount.value++;
  }

  void removeItem() {
    if (amount > 1) {
      amount.value--;
    }
  }

  void fetchdata() async {
    final reponse = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/Narmkhing/RESTAPI/main/yogaApi.json'));
    if (reponse.statusCode == 200) {
      final data = jsonDecode(reponse.body).cast<Map<String, dynamic>>();
      yogaModels.value =
          data.map<YogaModel>((json) => YogaModel.fromJson(json)).toList();
    } else {
      throw Exception("Failed");
    }
  }

  void addFav(YogaModel? yogaModel, String englishName) async {
    try {
      yogaModel?.englishName = englishName;
      await YogaDatabase.addFav((yogaModel ?? YogaModel()));
    } catch (e) {
      print(e.toString());
    }
  }

  void getFav() async {
    try {
      var foodMapList = await YogaDatabase.getFav();
      yogaModels.value = foodMapList.map((e) => YogaModel.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }
}
