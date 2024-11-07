import 'package:europark/screens/personal_screen.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';
import '../server_handler.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_bottom_navigation_bar.dart';
import '../widgets/user_item.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  static const routeName = '/welcome-screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  List<User> _users = [];
  bool _firstExec = true; // 4 single exec control


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void getUsers() {
    ServerHandler().getUsers('').then((value) => {
      setState(() {
        _users = value;
      })
    });
    // .catchError((e) => print(e));
  }


  @override
  Widget build(BuildContext context) {

    if (_firstExec) {
      getUsers();
      _firstExec = false;
    }

    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(), title: 'Выберите компанию'),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed(PersonalScreen.routeName),
                child: Text('Личный кабинет')
              ),
              Column(
                children: _users
                    .map((user) => UserItem(user: user))
                    .toList(),
              )

            ],
          ),
        ),
      ),

      bottomNavigationBar: const MyBottomNavigationBar(),


    );
  }
}
