import 'package:flutter/material.dart';
import 'package:todo_list/db/todo_database.dart';
import 'package:todo_list/todo/todo_list_container.dart';
import 'package:provider/provider.dart';

import 'bloc/todo_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await TodoDatabase.instance.int();
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('ToDo List'), centerTitle: true,),
        body:Provider<TodoBloc>.value(
          value: TodoBloc(),
          child: ToDoListCiontainer()
        ),
      ),
    );
  }
}


