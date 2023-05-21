// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';

import '../routes/routes.dart';
import '../shared/constants/ColorConstants.dart';
import '../shared/constants/background_grads.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  Future<void> _loadResources() async {
    //when we call Getx titleAnimationController before GetMaterialApp they generally stay in the memory
    //but here we call them after
  }

  @override
  void initState() {
    super.initState();
    _loadResources();
    Timer(
      const Duration(seconds: 4),
      () {
        Get.offNamed(Routes.getHomePage());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: ColorConstants.gray450),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                height: 250.0,
                width: 250.0,
                child: Image.asset('assets/images/splash_logo.png'),
              ),
            )));
  }
}
