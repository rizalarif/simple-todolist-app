import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/models/todo_model.dart';
import 'package:todo_list_app/pages/create_todo.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todoList, child) => ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: todoList.todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Checkbox(
                  value: todoList.todos[index].isDone,
                  onChanged: (value) {
                    context
                        .read<TodoModel>()
                        .doneToggle(todoList.todos[index].id);
                  },
                ),
                Text(todoList.todos[index].title),
                IconButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateTodo(),
                      ),
                    ),
                  },
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}


// ListTile(
//             title: Text(todoList.todos[index].title),
//             trailing: Switch(
//               value: todoList.todos[index].isDone,
//               onChanged: (value) {
//                 context.read<TodoModel>().doneToggle(todoList.todos[index].id);
//               },
//             ),
//           );