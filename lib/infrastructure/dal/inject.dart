import 'package:get/get.dart';

class Inject {
  Inject._();

  static T find<T>() {
    return Get.find<T>();
  }

  static void put<T>(T callback) {
    Get.put<T>(callback);
  }

  static void lazyPut<T>(T Function() callback) {
    Get.lazyPut<T>(callback);
  }
}
