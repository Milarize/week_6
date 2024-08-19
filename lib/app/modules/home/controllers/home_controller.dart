import 'package:get/get.dart';
import 'package:getx/app/data/services/todo_service.dart';
import 'package:getx/app/data/todo.dart';

class HomeController extends GetxController {
  final TodoService todoService = Get.find();

  void addNewTodo() {
    todoService
        .addTodo(Todo(title: 'New Task', description: 'Task Description'));
  }

  void toggleTodoStatus(int index) {
    todoService.toggleTodoStatus(index);
    update();
  }

  void removeTode(int index) {
    todoService.removeTodoAt(index);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
