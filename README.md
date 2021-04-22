# Project

- Demo of state management using [Get](https://pub.dev/packages/get)
- A simple counter app
- A TODO list app

## App design

- objective: let users to see all todo lists / add new todo / edit previous todo

### Views
1. TodoScreen: a ListView showing todo lists, a button to add new task
2. TodoUpdateScreen: a TextField allowing users to add new task, users could cancel

### Model (data):
- title (a task to complete)
- status (done , ongoing)

### Controller (logic):
- an array (List) of model
- [ ] -> [ Todo(title: 'task1', status: false), Todo(title: 'task2', status: false) ]
- add function (a built-in function for List)