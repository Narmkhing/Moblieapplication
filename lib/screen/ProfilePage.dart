import './CategoriesPage.dart';
import './Register.dart';
import 'package:flutter/material.dart';
import './LoginPage.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Categories(name: 'Firmigo')));
            },
            icon: const Icon(Icons.home),
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
        body: ListView(
          children: <Widget>[
            Container(
              height: 250,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 255, 203, 234),
                    Color.fromARGB(255, 245, 224, 219)
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.5, 0.9],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white70,
                        minRadius: 60.0,
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              'https://kpophit.com/wp-content/uploads/2021/08/Red-Velvet-Joy-Diet-and-Workout-%E2%80%94-This-is-How-scaled.jpg'),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Imyour Joy',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 32, 32),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 219, 189, 247),
                    child: const ListTile(
                      title: Text(
                        '300',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 68, 52, 85),
                        ),
                      ),
                      subtitle: Text(
                        'Followers',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 68, 52, 85),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: const Color.fromARGB(255, 245, 179, 220),
                    child: const ListTile(
                      title: Text(
                        '10',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Color.fromARGB(255, 102, 37, 37),
                        ),
                      ),
                      subtitle: Text(
                        'Following',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 102, 37, 37),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: const <Widget>[
                ListTile(
                  title: Text(
                    'Email',
                    style: TextStyle(
                      color: Color.fromARGB(222, 140, 78, 39),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'joy.redvelvet@gmail.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Name',
                    style: TextStyle(
                      color: Color.fromARGB(222, 140, 78, 39),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Imyour',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    'Surname',
                    style: TextStyle(
                      color: Color.fromARGB(222, 140, 78, 39),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Joy',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
