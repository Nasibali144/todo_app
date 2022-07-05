import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';
import 'package:todo_app/screens/task_detail_screen.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/views/completed_detail_view.dart';
import 'package:todo_app/views/to_do_detail_view.dart';

class DetailScreen extends StatefulWidget {
  static const id = "/detail_screen";
  final String? path;

  const DetailScreen({Key? key, this.path}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isCompleted = false;
  final TextEditingController _newTodoController = TextEditingController();

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _goBack() {
    Navigator.pop(context);
  }

  void _addATask() {
    String directoryPath = widget.path!;
    ToDo toDo = ToDo(
      taskName: _newTodoController.text.trim(),
      taskContent: '',
      category: 'folderName',
      isImportant: false,
      isCompleted: _isCompleted,
      createdDate: DateTime.now().toString(),
    );
    FocusScope.of(context).unfocus();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TaskDetailScreen(toDo: toDo, path: directoryPath,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: ThemeService.colorBackgroundLight,
        title: Text(
          "Folder Name",
          style: ThemeService.textStyleHeader(),
        ),
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(
            Icons.arrow_back,
            color: ThemeService.colorBlack,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mode_edit_outline_outlined,
              color: ThemeService.colorBlack,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline,
              color: ThemeService.colorBlack,
            ),
          )
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: ThemeService.colorBlack,
          tabs: const [
            Tab(
              text: "To Do",
            ),
            Tab(
              text: "Completed",
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: const [
              ToDoDetailView(),
              CompletedDetailView(),
            ],
          ),

          // #text_field
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: () => _textField(context),
              child: Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeService.colorUnselected,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add, color: ThemeService.colorBackgroundLight, size: 25,),
                    const SizedBox(width: 7.5,),
                    Text("Add a task", style: ThemeService.textStyleCaption(color: ThemeService.colorBackgroundLight),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _textField(BuildContext context){
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      elevation: 0,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
              child: Container(
                alignment: Alignment.center,
                color: ThemeService.colorBackgroundLight,
                constraints: const BoxConstraints(
                  maxHeight: 70,
                  minHeight: 70,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  autofocus: true,
                  controller: _newTodoController,
                  style: ThemeService.textStyleBody(),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: false,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: ThemeService.colorUnselected,
                          width: 2,
                        )
                    ),
                    hintText: "Add a task",
                    prefixIcon: Checkbox(
                      value: _isCompleted,
                      onChanged: (bool? value) {
                        _isCompleted = value!;
                        setState(() {});
                      },
                    ),
                  ),
                  onEditingComplete: _addATask,
                ),
              ),
            );
          }
        );
      },
    );
  }
}
