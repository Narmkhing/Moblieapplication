import '../screen/LoginPage.dart';
import '../screen/Register.dart';
import '../screen/YogaPage.dart';
import '../screen/FirstPage.dart';
import '../screen/ProfilePage.dart';
import 'package:flutter/material.dart';

import '../screen/FavPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Homepage',
      debugShowMaterialGrid: false,
      routes: {
        '/Homepage': (context) => const FirstPage(),
        '/Login': (context) => const LoginPage(),
        '/Register': (context) => const RegisterPage(),
        '/Yoga': (context) => YogaPage(),
        '/profile': (context) => const ProfilePage(),
        '/fav': (context) => const FavPage()
      },
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const FirstPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
