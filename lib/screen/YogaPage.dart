import '../screen/CategoriesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../controller/category_controller.dart';
import '../widgets/Yogaitem.dart';
import 'ProfilePage.dart';

class YogaPage extends StatefulWidget {
  YogaPage({super.key});
  @override
  State<YogaPage> createState() => _YogaPage();
}

class _YogaPage extends State<YogaPage> {
  int _selectedTab = 0;
  final List _screens = [
    {"screen": const Categories(name: 'Firmigo')},
    {"screen": const ProfilePage()}
  ];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => _changeTab(index),
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(
              icon: Icon(Icons.fitness_center), label: "Yoga")
        ],
      ),
    );
  }
}
