import 'package:app_news_flutter/bottom_nav_controller.dart';
import 'package:app_news_flutter/my_app.dart';
import 'package:app_news_flutter/presentation/news/controller/news_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';

void main() {
  Get.put(BottomNavController(), permanent: true);
  NewsBinding().dependencies();
  runApp(const MyApp());
}
