import 'package:flutter/material.dart';

class QuestionAppBar extends StatelessWidget {
  const QuestionAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Center(
        child: Text('English for beginners',
            style: TextStyle(color: Colors.black)),
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: true,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.question_mark),
          color: Colors.grey,
        )
      ],
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.grey,
        ),
        onPressed: () {},
      ),
    );
  }
}
