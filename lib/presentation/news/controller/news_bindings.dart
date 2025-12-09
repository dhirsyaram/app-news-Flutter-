import 'package:app_news_flutter/data/services/news_service.dart';
import 'package:app_news_flutter/presentation/news/controller/news_controller.dart';
import 'package:get/get.dart';

class NewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsService>(() => NewsService());
    Get.lazyPut<NewsController>(() => NewsController(Get.find<NewsService>()));
  }
}
