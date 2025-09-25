import 'package:flutter/material.dart';
import 'storage_service.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _remindersEnabled = true;
  int _totalTasks = 0;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final tasks = await StorageService.loadTasks();
    setState(() {
      _totalTasks = tasks.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SwitchListTile(
            title: Text('Enable Reminders'),
            value: _remindersEnabled,
            onChanged: (value) {
              setState(() {
                _remindersEnabled = value;
              });
              if (value) {
                _showReminderDialog();
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.storage),
            title: Text('Storage Method'),
            subtitle: Text(StorageService.getStorageType()),
          ),
          ListTile(
            leading: Icon(Icons.task),
            title: Text('Total Tasks'),
            trailing: Text('$_totalTasks'),
          ),
        ],
      ),
    );
  }

  void _showReminderDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Reminders Enabled'),
        content: Text('You will receive reminders for your tasks!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}