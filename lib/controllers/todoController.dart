import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:state/models/todo.dart';
import 'package:get/get.dart';

import '../models/todo.dart';

class TodoController extends GetxController {
  // Array of Todo
  // List<Todo> todos;
  // RxList<Todo> todos;
  // var todos = List<Todo>().obs;
  var todos = <Todo>[].obs;

  @override
  void onInit() {
    super.onInit();
    print('Controller is created');

    // =========== Load data ==========
    // 1. Load data from local storage
    // List<Map<String,dynamic>> todosSave = GetStorage().read('todos');
    List todosSave = GetStorage().read('todos');
    if (todosSave != null) {
      // print('Data loaded');
      // print(todosSave);
      // Our loaded data is a List of Map
      // [{title: task1, status: false}, {title: task2, status: false}]

      // --------------- Method 1 ---------------
      /*
      // 2. Convert List of Map to List of Todo object
      List<Todo> todosTemp = [];
      for (int i = 0; i < todosSave.length; i++) {
        // Map<String, dynamic> task = todosSave[i];
        // todosTemp.add(Todo(title: task['title'], status: task['status']));
        todosTemp.add(
            Todo(title: todosSave[i]['title'], status: todosSave[i]['status']));
      }
      // print(todosTemp);
      // 3. Convert List of Todo object to obs
      todos = todosTemp.obs;
      */

      // --------------- Method 2 ---------------
      // Iterable x = todosSave.map((task) {
      //   // convert Map to Todo object
      //   return Todo(title: task['title'], status: task['status']);
      // });
      // Iterable x = todosSave.map((task) => Todo(title: task['title'], status: task['status']));
      // List<Todo> todosTemp = x.toList();
      // List<Todo> todosTemp = todosSave.map((task) => Todo(title: task['title'], status: task['status'])).toList();
      // todos = todosTemp.obs;

      // todos = todosSave
      //     .map((task) => Todo(title: task['title'], status: task['status']))
      //     .toList()
      //     .obs;

      // --------------- Method 3 ---------------
      // todos = todosSave
      //     .map((task) => Todo().fromJson(task))
      //     .toList()
      //     .obs;

      todos = todosSave.map((task) => Todo.fromJson(task)).toList().obs;
    }

    // =========== Create worker to listen to todos changes ==========
    ever(todos, (_) {
      // =========== Save data ==========
      // print('Data changed');

      // --------------- Method 1 ---------------
      /*
      // 1. convert obs to simple list
      List<Todo> todosList = todos.toList();

      // 2. convert the member object to json
      List<String> todosJson = [];
      for(int i=0; i<todosList.length; i++) {
        // String str = todosList[i].toJSON();
        // todosJson.add(str);
        todosJson.add(todosList[i].toJSON());
      }

      // 3. convert the entire list to json
      String todosSave = jsonEncode(todosJson);
      print(todosSave);

      // 4. save json to storage
      // GetStorage().write('todos', todosSave);
      */

      // --------------- Method 2 ---------------
      /*
      // 1. convert obs to simple list
      List<Todo> todosList = todos.toList();

      // 2. convert an entire list to json
      String todosSave = jsonEncode(todosList); 
      // print(todosSave);
      
      // 3. save json to storage
      GetStorage().write('todos', todosSave);
      */

      // --------------- Method 3 ---------------
      // 1. convert obs to simple list
      // List<Todo> todosList = todos.toList();

      // 2. save json to storage
      // GetStorage().write('todos', todosList);

      // write() will use jsonEncode()
      GetStorage().write('todos', todos.toList());
    });
  }

  // toggle checkbox status of a selected task
  void updateStatus(int index, bool done) {
    // get the selected task
    var task = todos[index];
    // update the task
    task.status = done;
    // update member of obs list
    todos[index] = task;
    // todos[index].status = done;
  }

  // update the task's tile
  void updateTitle(int index, String title) {
    // todos[index].title = title;
    // get the selected task
    var task = todos[index];
    // update the task
    task.title = title;
    // update member of obs list
    todos[index] = task;
  }
}
