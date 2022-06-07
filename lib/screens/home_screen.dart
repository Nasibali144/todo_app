import 'package:flutter/material.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/screens/search_screen.dart';
import 'package:todo_app/services/theme_service.dart';
import 'package:todo_app/services/util_service.dart';
import 'package:todo_app/views/search_view.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/home_screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late User _user;

  @override
  initState() {
    super.initState();
    _getUser();
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
              child: Text(Utils.getFirstLetters(_user.fullName), style: ThemeService.textStyleBody(color: ThemeService.colorBackgroundLight),),
            ),
          ),
        ),
        centerTitle: false,
        title: Text(_user.fullName, style: ThemeService.textStyleBody(),),
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
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
