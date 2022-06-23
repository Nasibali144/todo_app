import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/services/lang_service.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/services/util_service.dart';

Future showCreateDialog(BuildContext context) async{
  TextEditingController controller = TextEditingController();

  void submit() async {
    String msg = "";
    String folderName = controller.text.trim().toString();
    Directory baseDir = await getApplicationDocumentsDirectory();

    String fullPath = "${baseDir.path}/$folderName";
    Directory directory = Directory(fullPath);
    bool isExist = await directory.exists();
    if(isExist) {
      msg = "This folder allready exist!";
    } else {
      await directory.create();
      msg = "Folder Successfully created!";
    }
    Utils.fireSnackBar(msg, context);
    Navigator.pop(context);
  }

  void cancel() {
    Navigator.pop(context);
  }

  showDialog(
      context: context,
      builder: (c) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          title: Text("new_list".tr),
          content: Container(
            color: ThemeService.colorTextFieldBack,
            child: TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "enter_list_title".tr,
              ),
            ),
          ),
          actions: [
            TextButton(
                onPressed: cancel,
                child: Text("cancel".tr)),
            ElevatedButton.icon(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(const StadiumBorder())),
              onPressed: submit,
              icon: const Icon(Icons.add),
              label: Text("create".tr),
            )
          ],
        );
      });
}
