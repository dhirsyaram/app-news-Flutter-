import 'package:app_news_flutter/bottom_nav_controller.dart';
import 'package:app_news_flutter/presentation/news/views/news_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_news_flutter/presentation/dashboard/views/dashboard_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<BottomNavController>();

    final pages = const [
      DashboardView(),
      NewsView(),
      Center(child: Text("Profile Page")),
    ];

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            homeController.selectedIndex.value == 0
                ? "Dashboard"
                : homeController.selectedIndex.value == 1
                ? "News"
                : "Profile",
          ),
        ),
        body: IndexedStack(
          index: homeController.selectedIndex.value,
          children: const [
            DashboardView(),
            NewsView(),
            Center(child: Text("Profile Page")),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.changePage,
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
