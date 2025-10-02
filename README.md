 Study Planner App

A Flutter mobile application for managing study tasks with calendar integration, reminders, and persistent local storage.

📱 Features

- Task Management: Create, edit, and delete study tasks with titles, descriptions, and due dates
- Today View: Quick access to tasks due today with completion tracking
- Calendar View: Interactive monthly calendar showing all scheduled tasks
- Reminders: Set specific time reminders for important tasks
- Persistent Storage: All tasks saved locally using SharedPreferences
- Material Design: Clean, intuitive UI following Material Design guidelines

 🏗 Architecture

 Project Structure


lib/
├── main.dart                 App entry point and main navigation
├── models/
│   └── task.dart             Task data model with JSON serialization
├── services/
│   └── storage_service.dart  Local storage implementation
├── screens/
│   ├── today_screen.dart     Today's tasks view
│   ├── calendar_screen.dart  Calendar view with date selection
│   └── settings_screen.dart App settings and preferences
└── widgets/
    ├── task_tile.dart        Reusable task list item widget
    └── add_task_dialog.dart  Task creation/editing dialog


Key Components
1. Task Model (models/task.dart)
- Represents a study task with properties:
 - id: Unique identifier
 - title: Task name
  - description: Detailed information
  - dueDate: Scheduled date
  - reminderTime: Optional reminder datetime
  - isCompleted: Completion status
- Includes toJson() and fromJson() for serialization

 2. Storage Service (services/storage_service.dart)
- Manages data persistence using SharedPreferences
- Methods:
  - saveTasks(): Serializes and saves task list
  - loadTasks(): Retrieves and deserializes tasks
  - setReminderEnabled(): Saves reminder preference
  - isReminderEnabled(): Loads reminder preference
- Error handling with try-catch blocks

 3. Main Screen (main.dart)
- Bottom navigation with 3 tabs: Today, Calendar, Settings
- State management for task list
- CRUD operations (Create, Read, Update, Delete)

 4. Today Screen (screens/today_screen.dart)
- Filters tasks for current date
- Displays tasks in ListView
- Sorts incomplete tasks first
- FloatingActionButton for adding new tasks

 5. Calendar Screen (screens/calendar_screen.dart)
- Monthly calendar view using GridView
- Highlights dates with scheduled tasks
- Date selection to view specific day's tasks
- Navigation between months

 6.Settings Screen (screens/settings_screen.dart)
- Toggle reminder notifications
- Display app information
- Storage method information



 Installation

1. Clone the repository
   bash
   git clone https://github.com/Seyiranky/Individual-assignment_1/
   cd Individual-assignment_1
   

2. Install dependencies
   bash
   flutter pub get
   

3. Run the app
   bash
   flutter run
   

 💻 Usage

 Adding a Task

1. Tap the + (FloatingActionButton) on Today or Calendar screen
2. Enter task title (required)
3. Add description (optional)
4. Select due date using date picker
5. Set reminder time (optional)
6. Tap Add to save

 Viewing Tasks

- Today Tab: See all tasks due today
- Calendar Tab: View tasks by month, tap any date to see its tasks

 Managing Tasks

- Complete: Check the checkbox to mark task as done
- Edit: Tap the menu icon (⋮) → Select "Edit"
- Delete: Tap the menu icon (⋮) → Select "Delete"

 Settings

- Toggle reminder notifications on/off
- View storage method and app version
 🎨 UI/UX Design

 Material Design Widgets Used

- Scaffold: Main app structure
- AppBar: Screen headers with navigation
- BottomNavigationBar: Tab navigation
- ListView.builder: Efficient task list rendering
- Card: Task item containers
- ListTile: Consistent task layout
- FloatingActionButton: Primary action (add task)
- AlertDialog: Task creation/editing modal
- TextFormField: Input fields with validation
- DatePicker & TimePicker: Date/time selection
- Checkbox: Task completion toggle
- PopupMenuButton: Task actions menu

Design Principles

- Consistency: Uniform color scheme and spacing
- Feedback: Visual response to user actions
- Clarity: Clear labels and intuitive icons
- Efficiency: Quick access to common actions

 📦 Data Persistence

 Storage Implementation

The app uses SharedPreferences for local data storage:

1. Serialization: Tasks converted to JSON format
2. Storage: JSON string saved with key 'tasks'
3. Retrieval: JSON parsed back to Task objects on startup
4. Updates: Automatic save on any task modification

 Data Flow


User Action → Update State → Save to SharedPreferences
                                      ↓
App Restart → Load from SharedPreferences → Populate State → Display


 🧪 Testing

Run on a physical device or emulator:

bash
 Android
flutter run -d <device-id>

 iOS
flutter run -d <device-id>


Note: This app is designed for mobile platforms. Web version not supported for this assignment.

📋 Code Quality Features

- Modular Structure: Separated concerns (models, services, screens, widgets)
- Clear Naming: Descriptive variable and function names
- Comments: Explanations for complex logic
- Error Handling: Try-catch blocks in storage operations
- State Management: Proper use of StatefulWidget and setState
- Resource Management: dispose() methods for controllers
- Validation: Form validation for required fields
- Sorting: Organized task display (incomplete first)

 🔄 State Management

Tasks managed in MainScreen state and passed down to child widgets:

- props: tasks, onAddTask, onUpdateTask, onDeleteTask
- callbacks: Update parent state and trigger storage save
- rebuild: setState() refreshes UI after changes



🎥 Demo Video

Link to demo video:[https://www.loom.com/share/aa2c00c2e1b84f82a7064714a8cfbb8d?sid=6b5ebbe1-5482-4b3d-934a-3329010639b3](url)

 📝 Assignment Requirements Met

✅ Code Quality: Organized folder structure, meaningful names, comprehensive comments  
✅ Core Features: Task creation, today view, calendar integration, reminders  
✅ Navigation: BottomNavigationBar with 3 screens  
✅ UI/UX: Material Design widgets, consistent layout  
✅ Local Storage: SharedPreferences with JSON serialization  
✅ Persistence: Tasks survive app restarts  

👨‍💻 Developer

Adebayo Seyi
Email: s.adebayo@alustudent.com 
GitHub:https://github.com/Seyiranky/Individual-assignment_1 

