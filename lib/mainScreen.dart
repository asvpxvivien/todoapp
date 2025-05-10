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
  List<String> todoList = ["Drink Water", "Go to Market", "Go to Gym"];
  void addTodo({required String todoText}) {
    setState(() {
      todoList.insert(0, todoText);
    });
    Navigator.pop(context);
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
                      child: Addtodo(addTodo: addTodo),
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
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("Mark as done"),
                    ),
                  );
                },
              );
            },
            title: Text(todoList[index]),
          );
        },
      ),
    );
  }
}
