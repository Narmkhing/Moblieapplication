import 'package:flutter/material.dart';
import '../controller/category_controller.dart';

import '../screen/YogadetailPage.dart';
import 'package:get/get.dart';
import '../models/Yoga_model.dart';

class Itemyoga extends StatelessWidget {
  final YogaModel yogaModel;

  const Itemyoga({required this.yogaModel, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CathController cathController = Get.put(CathController());
    cathController.fetchdata();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          bottom: 0,
          child: Card(
            elevation: 1,
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(5),
              height: 140,
              width: MediaQuery.of(context).size.width * 0.5 - 48,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    yogaModel.englishName ?? "",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(yogaModel.sanskritName ?? "",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 10,
                      )),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => YogaDetailPage(
                                    yogaModel: yogaModel,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 226, 54, 132)),
                    child: const Text("Start"),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Image.network(
              yogaModel.imgUrl ?? '',
              height: 150,
              width: 168,
            )),
      ],
    );
  }
}
