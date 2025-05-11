import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp/addTodo.dart';
import 'package:todoapp/widgets/todoList.dart';
// import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  List<String> todoList = [];

  void addTodo({required String todoText}) {
    if (todoList.contains(todoText)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Already exists"),
            content: Text("This todo data already exists"),

            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );

      return;
    }
    setState(() {
      todoList.insert(0, todoText);
    });
    updateLocalData();
    Navigator.pop(context);
  }

  void updateLocalData() async {
    // Obtain shared preferences.
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('todoList', todoList);
  }

  void loadData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    todoList = prefs.getStringList("todoList") ?? [];
    setState(() {});
  }

  @override
  void initState() {
    loadData(); // Chargement des données sauvegardées
    super.initState();
  }

  void showAddTodoBouttonSheet() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              color: Colors.blueGrey[900],
              height: 200,
              width: double.infinity,
              child: Center(
                child: Text(
                  "Todo App",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(
                "About Me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo App"),
        actions: [
          InkWell(
            onTap: showAddTodoBouttonSheet,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: TodoListBuilder(
        todoList: todoList,
        updateLocalData: updateLocalData,
      ),
    );
  }
}
