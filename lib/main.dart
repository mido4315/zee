import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login_screen.dart';
import 'package:flutter_application_1/screens/register_screen.dart';

import 'screens/addDocument.dart';
import 'screens/addMedicine.dart';
import 'screens/addReminder.dart';
import 'screens/add_screen.dart';
import 'screens/start_screen.dart';

void main() {
  runApp(ZEE());
}

class ZEE extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'LoginScreen': (context) => LoginScreen(),
        'RegisterScreen': (context) => RegisterScreen(),
        'StartScreen': (context) => StartScreen(),
        'AddScreen': (context) => AddScreen(),
        'AddDocument': (context) => AddDocument(),
        'AddMedicine': (context) => AddMedicine(),
        'AddRemider': (context) => AddRemider(),
      },
      initialRoute: 'StartScreen',
    );
  }
}
