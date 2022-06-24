import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/views/completed_detail_view.dart';
import 'package:todo_app/views/to_do_detail_view.dart';

class DetailScreen extends StatefulWidget {
  static const id = "/detail_screen";
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with SingleTickerProviderStateMixin {

  late TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: ThemeService.colorBackgroundLight,
        title: Text("Folder Name", style: ThemeService.textStyleHeader(),),
        leading: IconButton(
          onPressed: _goBack,
          icon: const Icon(Icons.arrow_back, color: ThemeService.colorBlack,),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.mode_edit_outline_outlined, color: ThemeService.colorBlack,),),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline, color: ThemeService.colorBlack,),)
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: ThemeService.colorBlack,
          tabs: const [
            Tab(text: "To Do",),
            Tab(text: "Completed",),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ToDoDetailView(),
          CompletedDetailView(),
        ],
      ),
    );
  }
}
