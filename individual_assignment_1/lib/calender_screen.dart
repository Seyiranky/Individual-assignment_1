import 'package:flutter/material.dart';
import 'task.dart';
import 'storage_service.dart';
import 'add_task_dialog.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    tasks = await StorageService.loadTasks();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'December 2024',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Text('Tasks by Date:', style: TextStyle(fontSize: 18)),
          Expanded(
            child: tasks.isEmpty
                ? Center(child: Text('No tasks to show on calendar'))
                : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                final task = tasks[index];
                return Card(
                  child: ListTile(
                    title: Text(task.title),
                    subtitle: Text('Due: ${task.dueDate.day}/${task.dueDate.month}/${task.dueDate.year}'),
                  ),
                );
              },
            ),
          ),
        ],
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
}