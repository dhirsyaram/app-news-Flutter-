import 'package:app_news_flutter/bottom_nav_controller.dart';
import 'package:app_news_flutter/presentation/dashboard/views/dashboard_view.dart';
import 'package:app_news_flutter/presentation/news/views/news_view.dart';
import 'package:app_news_flutter/presentation/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BottomNavController>();

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            controller.titles[controller.selectedIndex.value],
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: const [DashboardView(), NewsView(), ProfileView()],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changePage,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: "News"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
