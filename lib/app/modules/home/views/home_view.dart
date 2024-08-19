import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          return ListView.builder(
              itemCount: controller.todoService.todos.length,
              itemBuilder: (context, index) {
                final todo = controller.todoService.todos[index];
                return Ink(
                  color: todo.isDone ? Colors.blue : Colors.transparent,
                  child: ListTile(
                      tileColor: todo.isDone ? Colors.blue : null,
                      title: Text(todo.title),
                      subtitle: Text(todo.description),
                      trailing: IconButton(
                          onPressed: () {
                            controller.removeTode(index);
                          },
                          icon: Icon(Icons.delete)),
                      onLongPress: () {
                        controller.toggleTodoStatus(index);
                        log('${todo.isDone}');
                      }),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addNewTodo();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
