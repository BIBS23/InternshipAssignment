import 'package:demo/api/fetchdata.dart';
import 'package:demo/controller/logincontroller.dart';
import 'package:demo/pages/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(AuthController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.put(AuthController());
    Get.put(DataController());
    return GetMaterialApp(
      theme: ThemeData(
        useMaterial3: true

      ),
      home: LoginPage(),
    );
  }
}
