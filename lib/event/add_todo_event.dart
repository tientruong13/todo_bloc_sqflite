

import 'package:todo_list/base/base_event.dart';

class AddToDoEvent extends BaseEvent{
  String content;

  AddToDoEvent(this.content);

}