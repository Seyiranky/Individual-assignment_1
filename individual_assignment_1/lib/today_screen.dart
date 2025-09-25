import 'package:flutter/material.dart';
import 'task.dart';
import 'storage_service.dart';
import 'add_task_dialog.dart';

class TodayScreen extends StatefulWidget {
  @override
  _TodayScreenState createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final loadedTasks = await StorageService.loadTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Today\'s Tasks'),
        backgroundColor: Colors.blue,
      ),
      body: tasks.isEmpty
          ? Center(child: Text('No tasks yet!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return ListTile(
                  title: Text(task.title),
                  subtitle: Text(task.description),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteTask(index),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _addTask() async {
    final task = await showDialog<Task>(
      context: context,
      builder: (context) => AddTaskDialog(),
    );
    if (task != null) {
      tasks.add(task);
      await StorageService.saveTasks(tasks);
      setState(() {});
    }
  }

  Future<void> _deleteTask(int index) async {
    tasks.removeAt(index);
    await StorageService.saveTasks(tasks);
    setState(() {});
  }
}
