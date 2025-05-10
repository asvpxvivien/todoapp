import 'package:flutter/material.dart';
import 'package:todoapp/addTodo.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  String text = "Add a simple todo task";
  void changeText({required String todoText}) {
    setState(() {
      text = " $todoText";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: Text("Drawer data")),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo App"),
        actions: [
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      height: 200,
                      child: Addtodo(changeText: changeText),
                    ),
                  );
                },
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Container(child: Text("$text")),
    );
  }
}
