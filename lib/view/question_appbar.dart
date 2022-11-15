import 'package:flutter/material.dart';

class QuestionAppBar extends StatelessWidget {
  const QuestionAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 20,
      title: const Center(
        child: Text('English for beginners',
            style: TextStyle(color: Color(0xff495163))),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.question_mark),
          color: Color(0xffDBDDE1),
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Color(0xffDBDDE1),
        ),
        onPressed: () {},
      ),
    );
  }
}
