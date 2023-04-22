import 'package:demo/models/Yoga_model.dart';
import 'package:flutter/material.dart';
import '../controller/category_controller.dart';
import 'package:get/get.dart';

class FavPage extends StatelessWidget {
  const FavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CathController cathController = Get.put(CathController());
    cathController.getFav();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Pose"),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Obx(() => cathController.yogaModels.isEmpty
              ? const Center(
                  child: Text("No data"),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      color: Color.fromARGB(255, 235, 222, 198),
                      child: Column(
                        children: [
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: Center(
                              child: Text(cathController
                                      .yogaModels[index].englishName ??
                                  ""),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: cathController.yogaModels.length,
                )),
        ),
      ),
    );
  }
}
