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

  ToDo.fromJson() {}

  Map<String, dynamic> toJson() => {};

  toString

  bool operator == () ...ToDo

  hashcode

  copareTo

}