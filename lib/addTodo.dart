import 'package:flutter/material.dart';

class Addtodo extends StatefulWidget {
  void Function({required String todoText}) addTodo;
  Addtodo({super.key, required this.addTodo});

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
          autofocus: true,
          controller: todoText,
          decoration: InputDecoration(
            hintText: "Write your todo task here....",
          ),
        ),
        ElevatedButton(
          onPressed: () {
            if (todoText.text.isNotEmpty) {
              widget.addTodo(todoText: todoText.text);
            }
            todoText.text = "";
          },
          child: Text("Add"),
        ),
      ],
    );
  }
}
