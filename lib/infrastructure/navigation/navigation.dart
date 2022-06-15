import 'package:ekko/infrastructure/navigation/bindings/controllers/detais.controller.binding.dart';
import 'package:ekko/infrastructure/navigation/bindings/controllers/home.controller.binding.dart';
import 'package:ekko/presentation/screens.dart';
import 'package:get/get.dart';

import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.home,
      page: () => HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.details,
      page: () => DetailsScreen(),
      binding: DetailsControllerBinding(),
    ),
  ];
}
