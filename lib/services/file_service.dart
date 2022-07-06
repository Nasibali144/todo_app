import 'dart:convert';
import 'dart:io';
import 'package:todo_app/models/todo_model.dart';

class FileService {
  static Future<void> createToDo(ToDo todo) async {
    String pathDirectory = todo.category;
    String fileName = todo.taskName;
    fileName += ".todo";
    File file = File("$pathDirectory/$fileName");
    String data = jsonEncode(todo.toJson());
    await file.writeAsString(data);
  }

  static Future<void> deleteToDo(ToDo todo) async {
    String pathDirectory = todo.category;
    String fileName = todo.taskName;
    fileName += ".todo";
    File file = File("$pathDirectory/$fileName");
    await file.delete();
  }

  static Future<List<ToDo>> getAllToDo(String directoryPath) async {
    Directory directory = Directory(directoryPath);
    List<FileSystemEntity> items = directory.listSync();
    List<ToDo> toDos = [];

    for (var element in items) {
      if(!element.path.contains(".todo")) {
        continue;
      }
      ToDo toDo = await readToDo(element.path);
      toDos.add(toDo);
    }

    return toDos;
  }

  static Future<ToDo> readToDo(String path) async {
    File file = File(path);
    String data = await file.readAsString();
    ToDo toDo = ToDo.fromJson(jsonDecode(data));
    return toDo;
  }
}