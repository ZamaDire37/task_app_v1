import 'dart:async';

class ToDo {
  String? id;
  String? todoText;
  bool isDone;

  ToDo({required this.id, required this.todoText, this.isDone = false});

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText:'Finish the app', isDone: false),
      ToDo(id: '02', todoText:'CV', isDone: false),
      ToDo(id: '03', todoText:'100 pushups', isDone: false),
      ToDo(id: '04', todoText:'Meditate', isDone: false),
      ToDo(id: '05', todoText:'eat', isDone: true),
 

    ];
  }
}
