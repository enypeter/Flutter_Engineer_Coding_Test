import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_nav.dart';
import '../../helpers/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    boot();
    super.initState();
  }

  boot() async {
    Future.delayed(
        const Duration(seconds: 2), () => Get.offAll(() => AppNav()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      body: Center(
        child: RichText(
            text: const TextSpan(
                style: TextStyle(
                    color: WHITE,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Alata'),
                children: [
              TextSpan(text: 'Monie'),
              TextSpan(text: 'Point', style: TextStyle(color: PRIMARYCOLOR))
            ])),
      ),
    );
  }
}
