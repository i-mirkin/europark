import 'package:europark/screens/catalog_screen.dart';
import 'package:europark/screens/user_screen.dart';
import 'package:flutter/cupertino.dart';

import '../models/user.dart';

class UserItem extends StatefulWidget {
  final User user;

  UserItem({super.key, required this.user});

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CatalogScreen.routeName);

      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        height: 200,
        decoration: BoxDecoration(
            color: const Color.fromRGBO(160, 195, 255, 1.0),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Text(
                    widget.user.company!,
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                    padding: const EdgeInsets.only(top: 10, left: 10),
                    width: 150,
                    child: Text(
                      widget.user.info ?? '',
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 30, right: 20),
                  child: Image.network(
                    widget.user.workLogo!,
                    fit: BoxFit.fitWidth,
                    width: 120,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

}
