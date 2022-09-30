import 'package:finalproject/utils/di.dart';
import 'package:finalproject/views/home_screen.dart';
import 'package:finalproject/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: HomeScreen(),
        builder: EasyLoading.init(),
        smartManagement: SmartManagement.full,
        initialBinding: MyDI(),

        getPages: [
          GetPage(name: '/', page: ()=>const SplashScreen()),
          GetPage(name: HomeScreen.routeName, page: ()=> HomeScreen()),

        ],


    );
  }
}

