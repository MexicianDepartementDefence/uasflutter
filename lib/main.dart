// ignore_for_file: use_key_in_widget_constructors, avoid_print, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:uas_flutter_absen/app/controllers/auth_controller.dart';
import 'package:uas_flutter_absen/firebase_options.dart';


import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}


class MyApp extends StatelessWidget {
  final auth = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: auth.authStatus,
        builder: (context, snapshot) {
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.active) {
            return GetMaterialApp(
              title: "Application",
              initialRoute: snapshot.data != null ? Routes.HOME: Routes.LOGIN,
              getPages: AppPages.routes,
              debugShowCheckedModeBanner: false,
            );
          } else {
            return MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
          }
        });
  }
}
