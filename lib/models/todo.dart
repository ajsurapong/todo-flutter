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
  Map<String, dynamic> toJson() {
    return {'title': title, 'status': status};
  }
}
