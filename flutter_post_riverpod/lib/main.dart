import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(MyApp());
}

final todoProvider =
    StateNotifierProvider<TodoNotifier, AsyncValue<List<Todo>>>((ref) {
  return TodoNotifier(ref.read);
});

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: ProviderScope(
        child: TodoScreen(),
      ),
    );
  }
}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}

class TodoNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  final Reader _read;

  TodoNotifier(this._read) : super(const AsyncLoading()) {
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        state =
            AsyncData(jsonResponse.map((item) => Todo.fromJson(item)).toList());
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e, stackTrace) {
      state = AsyncError('Failed to fetch todos');
    }
  }
}

class TodoScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref){
    final todosAsync = ref.watch(todoProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: todosAsync.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
        data: (todos) => TodoList(todos: todos),
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> todos;

  TodoList({required this.todos});

  @override
  Widget build(BuildContext context) {
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