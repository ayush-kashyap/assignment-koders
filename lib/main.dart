import 'package:assignment_koder/routes/app_pages.dart';
import 'package:assignment_koder/Modules/splash/view/splash_view.dart';
import 'package:assignment_koder/theme/app_theme.dart';
import 'package:assignment_koder/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

void main() async{
  await Storage.init();
  runApp(ToastificationWrapper(child:const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
      getPages: AppPages.pages,
      initialRoute: Routes.splash,
      title: 'Flutter Assignment',
      theme: AppTheme.theme,
    );
  }
}
