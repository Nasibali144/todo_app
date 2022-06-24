import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/theme_service.dart';

class ToDoDetailView extends StatefulWidget {
  const ToDoDetailView({Key? key}) : super(key: key);

  @override
  State<ToDoDetailView> createState() => _ToDoDetailViewState();
}

class _ToDoDetailViewState extends State<ToDoDetailView> {
  
  List<ToDo> items = [];
  bool isLoading = false;
  
  @override
  initState() {
    super.initState();
    _readToDo();
  }
  
  void _readToDo() {
    setState(() {
      isLoading = true;
    });
    // TODO: you will write code to read notes
    items = [
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: false, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: false, createdDate: DateTime.now().toString()),
    ];
    setState((){
      isLoading = false;
    });
  }

  void _moveToDoCompleted(bool? tapped, ToDo toDo) {
    // TODO this note moved to completed
    setState(() {
      toDo.isCompleted = tapped!;
    });
  }

  void _addOrRemoveToDoInImportant(ToDo toDo) {
    // TODO this note's isImportant field changed and changed database
    setState((){
      toDo.isImportant = !toDo.isImportant;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            ToDo toDo = items[index];
            return Card(
              clipBehavior: Clip.antiAlias,
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: Slidable(
                endActionPane: ActionPane(
                  extentRatio: 0.2,
                  motion: const ScrollMotion(),
                  children: [
                    SlidableAction(
                      onPressed: (context) {},
                      backgroundColor: ThemeService.colorPink,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline,
                    ),
                  ],
                ),
                key:  ValueKey(toDo),
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 10),
                  leading: Checkbox(
                    value: toDo.isCompleted,
                    onChanged: (tapped) => _moveToDoCompleted(tapped, toDo),
                  ),
                  title: Text(
                    toDo.taskName,
                    style: ThemeService.textStyleBody(),
                  ),
                  subtitle: Text(
                    toDo.createdDate,
                    style: ThemeService.textStyleCaption(color: ThemeService.colorSubtitle),
                  ),
                  trailing: IconButton(
                    onPressed: () => _addOrRemoveToDoInImportant(toDo),
                    icon: toDo.isImportant ? const Icon(CupertinoIcons.star_fill, color: ThemeService.colorPink) : const Icon(CupertinoIcons.star),
                  ),
                ),
              ),
            );
          },
        ),

        if(isLoading) const Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
