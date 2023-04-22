import '../screen/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controller/category_controller.dart';
import '../widgets/Yogaitem.dart';

class YogaPage extends StatelessWidget {
  YogaPage({super.key});

  final CathController cathController = Get.put(CathController());

  @override
  Widget build(BuildContext context) {
    cathController.fetchdata();
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercise'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Categories(name: 'Firmigo')));
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(Icons.people),
              color: Colors.black,
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Obx(() => GridView.builder(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 18,
                            mainAxisExtent: 280,
                            crossAxisSpacing: 18),
                    itemCount: cathController.yogaModels.length,
                    itemBuilder: (context, index) {
                      return Itemyoga(
                        yogaModel: cathController.yogaModels[index],
                      );
                    }))),
          ],
        ),
      ),
    );
  }
}
