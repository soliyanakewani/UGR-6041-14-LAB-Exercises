import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Todo App',
        home: TodoScreen(),
      ),
    );
  }
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
class TodoProvider with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      _todos = jsonResponse.map((item) => Todo.fromJson(item)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load todos');
    }
  }
}

class TodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: Center(
        child: FutureBuilder(
          future: todoProvider.fetchTodos(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return TodoList();
            }
          },
        ),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todos = Provider.of<TodoProvider>(context).todos;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(todos[index].title),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TodoDetailScreen(todo: todos[index]),
              ),
            );
          },
        );
      },
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  final Todo todo;

  TodoDetailScreen({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UserID: ${todo.userId}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "ID: ${todo.id}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Title:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(todo.title),
            SizedBox(height: 8),
            Text(
              'Completed:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(todo.completed ? 'Yes' : 'No'),
          ],
        ),
      ),
    );
  }
}