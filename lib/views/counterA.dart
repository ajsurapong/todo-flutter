import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/counterController.dart';
import 'package:state/views/counterB.dart';

class CounterA extends StatelessWidget {
  //create an object of counterController and then index it using Get.put()
  CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page A'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text('Count = ${_counterController.count}')),
            ElevatedButton(
              onPressed: () {
                Get.to(CounterB());
              },
              child: Text('Next'),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
            ),
          ],
        ),
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
