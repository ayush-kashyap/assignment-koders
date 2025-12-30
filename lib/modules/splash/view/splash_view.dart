import 'package:assignment_koder/modules/splash/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
        builder: (controller){
        return Scaffold(
          body: Center(
            child: Image.asset("assets/fav.png"),
          ),
        );
        }
    );
  }
}
