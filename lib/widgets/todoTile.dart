import 'package:flutter/material.dart';
import 'package:todo_app_2/model/todo.dart';


class TodoTile extends StatelessWidget {
  const TodoTile({
        super.key,
        required this.onCheck,
        required this.todo,
        required this.onRemove
    });

  final Function(Todo) onCheck;
  final Todo todo;
  final Function(Todo) onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white),
      margin: const EdgeInsets.only(right: 20, left: 20, top: 20),
      child: ListTile(
        onTap: () => onCheck(todo),
        leading: Icon(todo.onChecked ? Icons.check_box: Icons.check_box_outline_blank, color: Colors.purple,),
        title: Text(todo.title, style:  TextStyle(fontSize: 20, fontWeight: FontWeight.w400, decoration: todo.onChecked ? TextDecoration.lineThrough: TextDecoration.none ),),
        trailing: IconButton(
          onPressed: () => onRemove(todo), 
          icon: Icon(Icons.delete, color: Colors.red))
      ),

    );
  }
}