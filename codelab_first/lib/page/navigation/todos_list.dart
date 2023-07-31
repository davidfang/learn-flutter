import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

class TodosList extends StatelessWidget {
  static String routeName = '/navigation/todos_list';

  const TodosList({super.key});
  @override
  Widget build(BuildContext context) {
    var todos = List.generate(20, (i) => Todo('title $i', 'description $i'));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(todos[index].title),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TodoDetail(todo: todos[index])));
                },
              )),
    );
  }
}

class TodoDetail extends StatelessWidget {
  const TodoDetail({super.key, required this.todo});

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(todo.description),
      ),
    );
  }
}
