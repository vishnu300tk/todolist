import 'package:flutter/material.dart';
import 'package:hive_to_do_list/custom/button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback create;
  VoidCallback cancel;
  DialogBox(
      {super.key,
      required this.controller,
      required this.create,
      required this.cancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add New Task',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(text: 'create', onPressed: create),
                const SizedBox(
                  width: 8,
                ),
                MyButton(text: 'cancel', onPressed: cancel),
              ],
            )
          ],
        ),
      ),
    );
  }
}
