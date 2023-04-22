import 'package:demo/screen/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/category_controller.dart';
import '../models/Yoga_model.dart';

class YogaDetailPage extends StatelessWidget {
  final YogaModel? yogaModel;

  YogaDetailPage({Key? key, this.yogaModel}) : super(key: key);
  static const double cornerRadius = 20;
  final CathController cathController = Get.put(CathController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: null,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/Yoga");
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Categories(name: 'Firmigo')));
            },
            icon: const Icon(Icons.people_alt_outlined),
            color: Colors.black,
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.network(
                    yogaModel?.imgUrl ?? "",
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  Positioned(
                    top: (MediaQuery.of(context).size.height * 0.5) - 20,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(cornerRadius),
                              topRight: Radius.circular(cornerRadius))),
                    ),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints(
                    maxHeight: double.infinity,
                    minHeight: MediaQuery.of(context).size.height * 0.4),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            yogaModel?.englishName ?? "",
                            style: const TextStyle(
                              fontSize: 19,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            yogaModel?.procedure ?? "",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.blueGrey),
                          )),
                      const Padding(
                          padding: EdgeInsets.only(bottom: 12),
                          child: Text("Benefits: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black))),
                      Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            yogaModel?.benefits ?? "",
                            style: const TextStyle(
                                fontSize: 12, color: Colors.blueGrey),
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
