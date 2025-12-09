import 'package:app_news_flutter/app_pages.dart';
import 'package:app_news_flutter/app_routes.dart';
import 'package:app_news_flutter/bottom_nav_controller.dart';
import 'package:app_news_flutter/presentation/news/controller/news_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(NewsController(), permanent: true);
  Get.put(BottomNavController(), permanent: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      getPages: AppPages.pages,
    );
  }
}
