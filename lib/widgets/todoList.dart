import 'package:flutter/material.dart';

class TodoListBuilder extends StatefulWidget {
  List<String> todoList;

  void Function() updateLocalData;
  TodoListBuilder({
    super.key,
    required this.todoList,
    required this.updateLocalData,
  });

  @override
  State<TodoListBuilder> createState() => _TodoListBuilderState();
}

class _TodoListBuilderState extends State<TodoListBuilder> {
  // this function get triggered when list items is clicked
  void onItemclicked({required int index}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                widget.todoList.removeAt(index);
              });
              widget.updateLocalData();
              Navigator.pop(context);
            },
            child: Text("Mark as done"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return (widget.todoList.isEmpty)
        ? Center(child: Text("No items on your todo list"))
        : ListView.builder(
          itemCount: widget.todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.startToEnd,
              secondaryBackground: Container(
                color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
              background: Container(
                color: Colors.green,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                  widget.todoList.removeAt(index);
                });
                widget.updateLocalData();
              },
              child: ListTile(
                onTap: () {
                  onItemclicked(index: index);
                },
                title: Text(widget.todoList[index]),
              ),
            );
          },
        );
  }
}
