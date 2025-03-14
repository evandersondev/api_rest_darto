import 'dart:convert';

import 'package:api_rest/models/todo.dart';
import 'package:darto/darto.dart';

import '../database/database.dart';

class TodoController {
  final db = Database.instance.db;

  Future<void> getTodos(Request req, Response res) async {
    final todos = db.select("SELECT * FROM todos");
    return res.json(todos);
  }

  Future<void> getTodo(Request req, Response res) async {
    final id = req.params['id'];

    final todo = db.select("SELECT * FROM todos WHERE id = ?", [id]);

    return res.json(todo);
  }

  Future<void> addTodo(Request req, Response res) async {
    final body = await req.body;
    final todo = Todo.fromMap(jsonDecode(body));

    db.execute(
        'INSERT INTO todos (title, description, is_done) VALUES (?, ?, ?)',
        [todo.title, todo.description, todo.isDone]);

    return res.status(OK).end();
  }

  Future<void> deleteTodo(Request req, Response res) async {
    final id = req.params['id'];

    db.execute('DELETE FROM todos WHERE id = ?', [id]);

    return res.status(OK).end();
  }

  Future<void> updateTodo(Request req, Response res) async {
    final db = Database.instance.db;
    final id = req.params['id'];

    final todoExists = db.select("SELECT * FROM todos WHERE id = ?", [id]);

    if (todoExists.isEmpty) {
      return res.status(NOT_FOUND).json({'message': 'Todo not found'});
    }

    final body = await req.body;
    final todo = Todo.fromMap(jsonDecode(body));

    db.execute(
        'UPDATE todos SET title = ?, description = ?, is_done = ? WHERE id = ?',
        [todo.title, todo.description, todo.isDone, id]);

    return res.status(OK).end();
  }
}
