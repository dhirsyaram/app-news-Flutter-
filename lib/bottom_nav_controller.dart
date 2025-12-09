import 'package:get/get.dart';

class BottomNavController extends GetxController {
  var selectedIndex = 0.obs;

  final titles = ["Dashboard", "News", "Profile"];
  void changePage(int index) {
    selectedIndex.value = index;
  }
}
