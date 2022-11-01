import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/bloc/todo_bloc.dart';
import 'package:todo_list/event/delete_todo_event.dart';
import 'package:todo_list/model/todo.dart';

class ToDoList extends StatefulWidget {
  ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    var bloc = Provider.of<TodoBloc>(context);
    bloc.initData();
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<TodoBloc>(
      builder: ((context, bloc, child) => StreamBuilder<List<Todo>>(
        stream: bloc.todoListStream,
        builder: (context, snapshot) { 
          switch(snapshot.connectionState) {
            case ConnectionState.active:
          return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              snapshot.data![index].content, 
              style: TextStyle(fontSize: 20),),
            trailing: GestureDetector(
                  onTap:() {
                    bloc.event.add(DeleteToDoEvent(snapshot.data![index]));
                  },
                  child: Icon(Icons.delete, color: Colors.red[400]),
                  ),
                );
              }
            );
            case ConnectionState.waiting:
              return Center(
                child: Container(
                  width: 70,
                  height: 70,
                  child: Text("EMPTY", style: TextStyle(fontSize: 20))
                ),
              );
            case ConnectionState.none:
            default:
              return Center(
                child:Container(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(),
                ) ,
              );
          }

          }
        )
      ),
    );
  }
}