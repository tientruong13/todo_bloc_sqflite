import 'package:todo_list/base/base_event.dart';
import 'package:todo_list/model/todo.dart';
import '../base/base_event.dart';

class DeleteToDoEvent extends BaseEvent{
  Todo todo;

  DeleteToDoEvent(this.todo);

}