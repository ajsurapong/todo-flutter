import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/todoController.dart';
import 'package:state/models/todo.dart';

class TodoUpdateScreen extends StatelessWidget {
  final TodoController _todoController = Get.find();
  final TextEditingController _tcTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: _tcTask,
                  autofocus: true,
                  decoration: InputDecoration(
                      hintText: 'What to do?', border: InputBorder.none),
                  maxLines: 100,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('Cancel'),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _todoController.todos.add(Todo(title: _tcTask.text));
                      Get.back();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
