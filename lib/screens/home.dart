import 'package:flutter/material.dart';
import 'package:task_app_v1/Model/todo.dart';
import 'To_Do_Items.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.todoList();
  final _todoController = TextEditingController();
  List<ToDo> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _biuldApp(),
      body: Stack(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Column(
                children: [
                  //searchBox(),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: Text('Things To Do',
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.w500)),
                        ),
                        for (ToDo todoo in _foundToDo.reversed)
                          ToDoItems(
                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteToDoItem,
                          ),
                      ],
                    ),
                  )
                ],
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                  child: Container(
                margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 10.0,
                      spreadRadius: 0.0,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: _todoController,
                  decoration: InputDecoration(
                      hintText: 'Add A Task To Do', border: InputBorder.none),
                ),
              )),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 40),
                  ),
                  onPressed: () {
                    
                    _addToDoItem(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {});
    todo.isDone = !todo.isDone;
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String todo) {
    setState(() {
      todoList.add(ToDo(
          id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todo));
    });
    _todoController.clear();
    // _todosList.removeWhere((item) => item.id == id);
  }

  void _runFilter(String enrteredKeyword) {
    List<ToDo> result = [];
    if (enrteredKeyword.isEmpty) {
      result = todoList;
    } else {
      result = todoList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enrteredKeyword.toLowerCase()))
          .toList();
    }
  }

  // Widget searchBox() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white, borderRadius: BorderRadius.circular(20)),
  //     child: TextField(
  //       onChanged: (value) => _runFilter(value),
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(0),
  //         prefixIcon: Icon(
  //           Icons.search,
  //           color: Colors.black,
  //           size: 20,
  //         ),
  //         prefixIconConstraints: BoxConstraints(maxHeight: 20, minWidth: 25),
  //         border: InputBorder.none,
  //         hintText: 'Search Text',
  //         hintStyle: TextStyle(color: Colors.grey),
  //       ),
  //     ),
  //   );
  // }
}

AppBar _biuldApp() {
  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      // Icon(Icons.menu, color: Colors.black, size: 30),
      // Container(
      //   height: 40,
      //   width: 40,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.circular(20),
      //     child: Image.asset('images/Sasuke.jpg'),
      //   ),
      // ),
    ]),
  );
}
