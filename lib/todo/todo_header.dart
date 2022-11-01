import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/event/add_todo_event.dart';


class BuildHeader extends StatelessWidget {
  const BuildHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var txtTodoController = TextEditingController();
    var bloc = Provider.of<TodoBloc>(context);
    
    return Row(
      children: [
      Expanded(
        child: TextFormField(
          controller: txtTodoController,
          decoration: InputDecoration(
          labelText: 'Add Todo',
          hintText: 'Add ToDo'
         ), 
        ),
      ),
      SizedBox(width:10),

      ElevatedButton.icon(
        onPressed: () {
          bloc.event.add(AddToDoEvent(txtTodoController.text));
        }, 
        icon: Icon(Icons.add), 
        label:Text('Add'))
      
    ],
    );
  }
}

