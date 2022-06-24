import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/services/theme_service.dart';

class CompletedDetailView extends StatefulWidget {
  const CompletedDetailView({Key? key}) : super(key: key);

  @override
  State<CompletedDetailView> createState() => _CompletedDetailViewState();
}

class _CompletedDetailViewState extends State<CompletedDetailView> {
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
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: true, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: true, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: true, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: true, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: false, isCompleted: true, createdDate: DateTime.now().toString()),
      ToDo(taskName: "To do chayxana app", taskContent: "i write code for notification", category: "folder name", isImportant: true, isCompleted: true, createdDate: DateTime.now().toString()),
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
              child: Dismissible(
                background: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width,
                  color: ThemeService.colorPink,
                  child: const Icon(Icons.delete_outline, color: ThemeService.colorBackgroundLight,),
                ),
                onDismissed: (DismissDirection direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                },
                key: ValueKey<int>(toDo.hashCode),
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
                    icon: toDo.isImportant
                        ? const Icon(CupertinoIcons.star_fill, color
                        : ThemeService.colorPink) : const Icon(CupertinoIcons.star),
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
