class ToDo {
  String taskName;
  String taskContent;
  Object category;
  bool isImportant;
  bool isCompleted;
  String craetedDate;
  String? dueDate;

  ToDo({
    required this.taskName,
    required this.taskContent,
    required this.category,
    required this.isImportant,
    required this.isCompleted,
    required this.craetedDate,
    this.dueDate,
  });

  ToDo.fromJson(Map<String, dynamic> json)
      : taskName = json["taskName"],
        taskContent = json["taskContent"],
        category = json["category"],
        isImportant = json["isImportant"],
        isCompleted = json["isCompleted"],
        craetedDate = json["craetedDate"],
        dueDate = json["dueDate"];

  Map<String, dynamic> toJson() => {
        'taskName': taskName,
        'taskContent': taskContent,
        'category': category,
        'isImportant': isImportant,
        'isCompleted': isCompleted,
        'craetedDate': craetedDate,
        'dueDate': dueDate,
      };

  @override
  String toString() {
    return "Task name: $taskName\nTask content: $taskContent\nCategory: $category\nImportant: $isImportant\nCompleted: $isCompleted\nDate: $craetedDate\nDue date: $dueDate";
  }

  @override
  bool operator ==(Object other) {
    return other is ToDo &&
        other.taskName == taskName &&
        other.taskContent == taskContent &&
        other.category == category &&
        other.isImportant == isImportant &&
        other.isCompleted == isCompleted &&
        other.craetedDate == craetedDate &&
        other.dueDate == dueDate;
  }

  @override
  int get hashCode => Object.hash(taskName, taskContent, category, isImportant,
      isCompleted, craetedDate, dueDate);

  // compare to
}
