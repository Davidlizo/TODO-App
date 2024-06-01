class ToDo {
  final String id;
  final String title;
  bool isCompleted;
  bool isStarred;
  final DateTime dueDate;

  ToDo({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.isStarred = false,
    required this.dueDate,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'],
      isStarred: json['isStarred'],
      dueDate: DateTime.parse(json['dueDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'isStarred': isStarred,
      'dueDate': dueDate.toIso8601String(),
    };
  } 
  bool isOverdue() {
    return dueDate.isBefore(DateTime.now());
  }
}

