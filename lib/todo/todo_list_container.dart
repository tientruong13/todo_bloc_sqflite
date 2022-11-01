import 'package:flutter/material.dart';
import 'package:todo_list/todo/todo_header.dart';
import './todo_list.dart';

class ToDoListCiontainer extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          BuildHeader(),
          Expanded(child: ToDoList(),
          )
        ]
        ),
    );
  }
}