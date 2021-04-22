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
}
