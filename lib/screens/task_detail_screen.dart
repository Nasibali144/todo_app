import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_model.dart';

import '../services/theme_service.dart';
import '../views/completed_detail_view.dart';
import '../views/to_do_detail_view.dart';

class TaskDetailScreen extends StatefulWidget {
  static const id = "new_screen";
  final ToDo? toDo;

  const TaskDetailScreen({Key? key, this.toDo}) : super(key: key);

  @override
  State<TaskDetailScreen> createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  //removed
  bool showValue = false;
  bool type = true;


  late ToDo _toDo;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  initState() {
    super.initState();
    _getTodo();
  }

  void _getTodo() {
    _toDo = widget.toDo!;
    titleController = TextEditingController(text: _toDo.taskName);
    contentController = TextEditingController(text: _toDo.taskContent);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: ThemeService.colorBackgroundLight,
        title: Text(
          "Task List",
          style: ThemeService.textStyleHeader(),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: ThemeService.colorBlack,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.6,
                child: SingleChildScrollView(
                  primary: false,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 34),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                    left: 18,
                                  ),
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _toDo.isCompleted = value!;
                                      });
                                    },
                                    value: _toDo.isCompleted,
                                  ),
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                SizedBox(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width * 0.72,
                                  child: TextField(
                                    controller: titleController,
                                    style: ThemeService.textStyleHeader(),
                                    decoration: const InputDecoration(
                                      hintText: "Text Name",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 20),
                                child: _toDo.isImportant
                                    ?const Icon(Icons.star_border, color: Color(0x991c1b1f),)
                                    :const Icon(Icons.star, color: Color(0xffF85977),)
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Divider(
                          thickness: 1,
                          color: Color(0x1f1c1b1f),
                        ),
                      ),
                      type
                          ?Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(
                                  left: 18,
                                ),
                                width: 24,
                                height: 24,
                                child:Icon(
                                  Icons.edit_calendar,
                                  color: Colors.grey.shade600,
                                ),
                            ),
                            const SizedBox(
                              width: 19,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Add Due Date',
                                  style: TextStyle(
                                      color: Colors.grey.shade700,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                          :Container(
                            margin: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.only(
                                      left: 18,
                                    ),
                                    width: 24,
                                    height: 24,
                                    child: const Icon(
                                      Icons.edit_calendar,
                                      color: Color(0xff5946D2),
                                    )
                                ),
                                const SizedBox(
                                  width: 19,
                                ),
                                const Text(
                                  'Due Sun, 10 April',
                                  style: TextStyle(
                                      color: Color(0xff5946D2),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 33),
                                child: Icon(Icons.backspace_outlined, color: Colors.grey.shade700, size: 20,)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Divider(
                          thickness: 1,
                          color: Color(0x1f1c1b1f),
                        ),
                      ),
                      const SizedBox(
                        height: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        height: 248,
                        child: const TextField(
                          maxLines: 13,
                          decoration: InputDecoration(
                              hintText: "Add Note",
                              helperStyle: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0x991c1b1f)),
                              border: InputBorder.none),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Divider(
                          thickness: 2,
                          color: Color(0x1f1c1b1f),
                        ),
                      ),
                    ],
                  ),
                ),
            ),
            SizedBox(height: 170,),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(left: 20, right: 23),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Created on Mon, 28 March",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0x991c1b1f),
                    ),
                  ),
                  Icon(Icons.delete_outline, color: Color(0x991c1b1f))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
