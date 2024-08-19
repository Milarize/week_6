import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/home_controller.dart';

class Home extends GetView<HomeController> {
  @override
  Widget build(context) => Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: Center(
        child: Obx(() => Text("${controller.count}")),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: controller.increment,
      ));
}
