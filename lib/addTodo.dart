import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  void Function({required String todoText}) changeText;
  Addtodo({super.key, required this.changeText});

  @override
  State<Addtodo> createState() => _AddtodoState();
}

class _AddtodoState extends State<Addtodo> {
  TextEditingController todoText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Add todo: "),
        TextField(
          controller: todoText,
          decoration: InputDecoration(
            hintText: "Write your todo task here....",
            labelText: "Username",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            print(todoText.text);
            todoText.text = "";
            widget.changeText(todoText: todoText.text);
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
