import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monie_point_test/helpers/theme.dart';
import 'views/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      defaultTransition: Transition.zoom,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: PRIMARYCOLOR,
          scaffoldBackgroundColor: BACKGROUNDCOLOR,
          fontFamily: 'Outfit'),
      home: const SplashScreen(),
    );
  }
}

