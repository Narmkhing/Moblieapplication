/* CATEGORY */
import 'package:demo/screen/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  final String name;
  const Categories({super.key, required this.name});
  @override
  State<Categories> createState() => _CategoriesPage();
}

class _CategoriesPage extends State<Categories> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 246, 237),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 252, 245, 233),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/Homepage");
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
            itemPager(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome to Firmigo, ",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 200, 20, 116),
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text("Today's pick",
                textAlign: TextAlign.left, style: TextStyle(fontSize: 15)),
            Card(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  ListTile(
                    title: const Text('Yoga Meditation',
                        style: TextStyle(fontSize: 25)),
                    subtitle: const Text(
                        'The pose begins when you want to leave it.'),
                    leading: const Image(
                      image: NetworkImage(
                          "https://images.template.net/95381/cartoon-yoga-clipart-xobb1.jpg"),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/Yoga');
                    },
                  ),
                ],
              ),
            ),
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

  Widget itemPager() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.pink),
            height: 250,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 180,
            width: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://sharonmundy.com/wp-content/uploads/2022/09/woman-and-yoga-png-transparent.png"),
              ),
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Yoga",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 57,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 150,
                child: Text(
                  "Learn from the best yoga coachers anytime at home.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/Yoga');
                },
                child: Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 236, 210, 221),
                              Color.fromARGB(255, 238, 185, 231),
                              Color.fromARGB(255, 252, 188, 243),
                              Color.fromARGB(255, 253, 174, 242)
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: const Center(
                      child: Text(
                        "Get Started",
                        style: TextStyle(
                            color: Color.fromARGB(255, 71, 42, 71),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    )),
              )
            ],
          ),
        ),
      ],
    );
  }
}
