import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/app/data/todo.dart';
import 'package:getx/app/modules/home/controllers/home_controller.dart';

class EditTodoView extends StatelessWidget {
  final int? index;
  final Todo? todo;
  final _formKey = GlobalKey<FormState>();
  final HomeController controller = Get.find();

  EditTodoView({this.index, this.todo, Key? key}) : super(key: key) {
    if (this.todo != null) {
      controller.setEditedTodo(todo!);
    } else {
      controller.clearForm();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.titleFocus.requestFocus();
      },
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(this.todo != null ? 'Edit Todo' : 'Add New Todo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                focusNode: controller.titleFocus,
                controller: controller.titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: controller.descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description.';
                  }
                  return null;
                },
                maxLines: 3,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    if (todo == null) {
                      controller.addNewTodo();
                    } else {
                      controller.editTodo(this.index!);
                    }
                    Get.back();
                  }
                },
                child: Text(this.todo != null ? 'Edit' : 'Add new'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
