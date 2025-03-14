import 'dart:convert';

class Todo {
  final String title;
  final String description;
  final bool isDone;

  Todo({
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'is_done': isDone ? 1 : 0});

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['is_done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) => Todo.fromMap(json.decode(source));
}
