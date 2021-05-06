import 'dart:convert';

class Todo {
  String title;
  bool status;

  // constructor
  // Todo(String title, bool status) {
  //   this.title = title;
  //   this.status = status;
  // }

  // Todo(this.title, this.status);
  // Todo('hello', true);

  Todo({this.title, this.status = false});
  // Todo(title: 'hello', status: true);
  // Todo(title: 'hello');

  //convert class object to json
  //for Method 1 only
  String toJSON() {
    return jsonEncode({'title': title, 'status': status});
  }

  // flutter method to conver class to Map
  // this method will be called automatically when we use jsonEncode()
  // toJson is to convert Map or object to JSON
  Map<String, dynamic> toJson() {
    return {'title': title, 'status': status};
  }

  // fromJson is to convert JSON to object
  // Todo fromJson(Map<String, dynamic> json) {
  //   return Todo(title: json['title'], status: json['status']);
  // }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(title: json['title'], status: json['status']);
  }
}
