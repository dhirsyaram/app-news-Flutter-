import 'package:app_news_flutter/data/models/news_model.dart';
import 'package:app_news_flutter/data/services/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <NewsModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchNews();
  }

  void fetchNews() async {
    try {
      isLoading.value = true;
      final data = await NewsService.getNews();
      newsList.assignAll(data);
    } finally {
      isLoading.value = false;
    }
  }
}
