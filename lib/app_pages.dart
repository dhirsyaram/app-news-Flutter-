import 'package:app_news_flutter/app_routes.dart';
import 'package:app_news_flutter/home_view.dart';
import 'package:app_news_flutter/presentation/dashboard/views/dashboard_view.dart';
import 'package:app_news_flutter/presentation/news/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.home, page: () => const HomeView()),
    GetPage(name: AppRoutes.dashboard, page: () => const DashboardView()),
    GetPage(
      name: AppRoutes.news,
      page: () => const NewsView(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const Center(child: Text("Profile Page")),
    ),
  ];
}
