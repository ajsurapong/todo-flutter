import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:state/controllers/todoController.dart';
import 'package:state/views/todoUpdateScreen.dart';

class TodoScreen extends StatelessWidget {
  final TodoController _todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Obx(
        () => ListView.separated(
          itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text(_todoController.todos[index].title),
          ),
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: _todoController == null ? 0 : _todoController.todos.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Get.to(TodoUpdateScreen());
        },
      ),
    );
  }
}
