import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/modules/home/views/edit_todo_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<String> emojis = ['😃', '🚀', '✨', '💡', '🔥', '🎉', '🌟'];

  String getRandomEmoji() {
    final random = Random();
    return emojis[random.nextInt(emojis.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo_List ☕'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => EditTodoView());
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: const Text(
                '➕ AddNew',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () {
                return ListView.builder(
                    itemCount: controller.todoService.todos.length,
                    itemBuilder: (context, index) {
                      final todo = controller.todoService.todos[index];
                      return Card(
                        margin: const EdgeInsets.all(8.0),
                        elevation: 4,
                        child: Ink(
                          color: todo.isDone
                              ? Colors.blue.shade100
                              : Colors.white,
                          child: ListTile(
                            leading: Text(
                              getRandomEmoji(),
                              style: const TextStyle(fontSize: 24),
                            ),
                            title: Text(
                              todo.title,
                              style: TextStyle(
                                decoration: todo.isDone
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            subtitle: Text(todo.description),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.removeTode(index);
                                },
                                icon: const Icon(Icons.delete)),
                            onTap: () {
                              Get.to(() => EditTodoView(
                                  index: index, todo: todo));
                            },
                            onLongPress: () {
                              controller.toggleTodoStatus(index);
                            },
                          ),
                        ),
                      );
                    });
              },
            ),
          ),
        ],
      ),

    );
  }
}
