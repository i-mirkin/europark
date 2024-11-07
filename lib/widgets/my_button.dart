import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {

  final VoidCallback onTap;
  final Widget child;

  const MyButton({
    super.key,
    required this.onTap,
    required this.child

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color.fromRGBO(222, 222, 222, 1),
        side: const BorderSide(
          color: Colors.black12
        )
      ),
      child: Container(
        child: child
      ),
    );
  }
}


