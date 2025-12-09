import 'package:app_news_flutter/data/models/news_model.dart';
import 'package:app_news_flutter/data/services/news_service.dart';
import 'package:get/get.dart';


class NewsController extends GetxController {
  var isLoading = true.obs;
  var newsList = <NewsModel>[].obs;

  final NewsService service;

  NewsController(this.service);

  @override
  void onInit() {
    getNewsList();
    super.onInit();
  }

  void getNewsList() async {
    try {
      isLoading(true);
      final dataNews = await service.getNews();
      newsList.assignAll(dataNews);
    } catch (e) {
      print(e);
      newsList.clear();
    } finally {
      isLoading(false);
    }
  }
}
