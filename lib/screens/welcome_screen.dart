import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/themes/theme_of_app.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(top: 40, left: 30, right: 30),
                  child: Lottie.asset("assets/lotties/succes.json",
                      repeat: false, reverse: false),
                )),
            Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Text(
                      "Welcome to\n\tUno To Do",
                      textAlign: TextAlign.center,
                      style: Themes.textStyle1(),
                    )),
                    Text(
                      "Start using the best To Do app",
                      style: Themes.textStyle2(),
                    ),
                    MaterialButton(
                      minWidth: MediaQuery.of(context).size.width - 60,
                      height: 50,
                      onPressed: () {},
                      shape: StadiumBorder(),
                      color: Color(0xff5835E5),
                      child: Text(
                        "Get Started",
                        style: Themes.textStyle3(),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
