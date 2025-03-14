class Todo {
  final int? id;
  final String title;
  final String description;
  final bool isDone;

  Todo({
    this.id,
    required this.title,
    required this.description,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'is_done': isDone ? 1 : 0});

    return result;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone: map['is_done'] == 1 ? true : false,
    );
  }
}
