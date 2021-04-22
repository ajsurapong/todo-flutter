import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/counterController.dart';

class CounterB extends StatelessWidget {
  // find the previous saved controller
  CounterController _counterController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page B'),
      ),
      body: Container(
        child: Obx(() => Text('Count = ${_counterController.count}')),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _counterController.add();
        },
      ),
    );
  }
}
