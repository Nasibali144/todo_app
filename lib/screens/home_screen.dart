import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/screens/search_screen.dart';
import 'package:todo_app/services/lang_service.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/services/util_service.dart';
import 'package:todo_app/views/dioalogs.dart';
import 'package:todo_app/views/home_item.dart';
import 'package:todo_app/views/search_view.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;
  List<FileSystemEntity> listDirectory = [];

  @override
  initState() {
    super.initState();
    _getUser();
    _readFolder();
  }

  void _getUser() {
    // TODO: concrete updated => read user from database
    _user = User("Antonio Bonilla", "antonio.bonilla@horus.com.uy");
  }

  void _goSettingScreen() {
    // TODO: navigate setting page
  }

  void _showSearch() {
    showSearchCustom(
      context: context,
      delegate: SearchScreen(),
    );
  }

  Future<void> _readFolder() async {
    Directory baseDir = await getApplicationDocumentsDirectory();

    setState(() {
      listDirectory = baseDir.listSync();
    });
    for (var element in listDirectory) {
      if (kDebugMode) {
        print(element.parent.path);
        print(element.path);
      }
    }
  }

  Future<void> _createFolder(BuildContext context) async {
    await showCreateDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeService.colorBackgroundLight,
      appBar: AppBar(
        backgroundColor: ThemeService.colorBackgroundLight,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: _goSettingScreen,
            child: CircleAvatar(
              radius: 16,
              backgroundColor: ThemeService.colorMain,
              child: Text(
                Utils.getFirstLetters(_user.fullName),
                style: ThemeService.textStyleBody(
                    color: ThemeService.colorBackgroundLight),
              ),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(
          _user.fullName,
          style: ThemeService.textStyleBody(),
        ),
        actions: [
          IconButton(
            splashRadius: 25,
            onPressed: _showSearch,
            icon: const Icon(
              Icons.search,
              color: ThemeService.colorMain,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(children: [
          HomeItem(
              iconColor: ThemeService.colorPink,
              icon: Icons.star_outlined,
              title: "important".tr,
              onPressed: () {}),
          HomeItem(
              iconColor: ThemeService.colorMain,
              imageIcon: "assets/icons/ic_home.png",
              title: "tasks".tr,
              onPressed: () {}),
          Divider(
            height: 4,
            thickness: 2,
            endIndent: MediaQuery.of(context).size.width * 0.04,
            indent: MediaQuery.of(context).size.width * 0.04,
          ),
          HomeItem(
              iconColor: ThemeService.colorMainTask,
              icon: Icons.list,
              title: "tasks_list".tr,
              onPressed: () {}),
          HomeItem(
              iconColor: ThemeService.colorMainTask,
              icon: Icons.list,
              title: "house_list".tr,
              onPressed: () {}),
        ]),
      ),
      floatingActionButton: TextButton.icon(
        onPressed: () => _createFolder(context),
        icon: const Icon(
          Icons.add,
          color: ThemeService.colorMain,
        ),
        label: Text(
          "new_list".tr,
          style: ThemeService.textStyle2(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
