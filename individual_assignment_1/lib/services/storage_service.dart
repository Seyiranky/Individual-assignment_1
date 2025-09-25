import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'task.dart';

class StorageService {
  static const String _key = 'tasks';

  // Save tasks to phone storage
  static Future<void> saveTasks(List<Task> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = tasks.map((task) => jsonEncode(task.toJson())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  // Load tasks from phone storage
  static Future<List<Task>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key) ?? [];
    return jsonList.map((json) => Task.fromJson(jsonDecode(json))).toList();
  }

  // Get storage type for settings screen
  static String getStorageType() => 'SharedPreferences';
}
