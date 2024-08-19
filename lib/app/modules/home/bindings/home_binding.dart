import 'package:get/get.dart';
import 'package:getx/app/data/services/todo_service.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<TodoService>(() => TodoService());
  }
}
