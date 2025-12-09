import 'package:app_news_flutter/presentation/news/controller/news_controller.dart';
import 'package:app_news_flutter/presentation/news/widgets/card_list_news.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }
      if (controller.newsList.isEmpty) {
        return const Center(child: Text("No news available"));
      }

      return ListView.builder(
        itemCount: controller.newsList.length,
        itemBuilder: (context, index) {
          return CardListNews(newsModel: controller.newsList[index]);
        },
      );
    });
  }
}
