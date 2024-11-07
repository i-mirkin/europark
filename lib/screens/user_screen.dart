import 'package:europark/widgets/my_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/my_app_bar.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  static const routeName = '/user-screen';

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(appBar: AppBar(), title: 'Экран компании'),
      drawer: const MyDrawer(),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
            Text('5'),
            Text('6'),
          ],
        ),
      ),
    );
  }
}
