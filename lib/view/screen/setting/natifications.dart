import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../../core/shared/colors.dart';
import '../../../model/tasks_model.dart';
import '../../../core/function_sqflite/function_sqflite.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  List<TasksModel> tasks = [];

  @override
  void initState() {
    super.initState();

    // Initialize the notification plugin
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
    InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) async {
        print('Notification tapped with payload: ${response.payload}');
      },
    );

    // Initialize time zones
    tz.initializeTimeZones();
    print('Time zone initialized.');

    _loadTasks();
  }

  Future<void> _loadTasks() async {
    try {
      final List<Map<String, dynamic>>? maps =
      await SqfliteDB.getToDataBaseWithStatus('Tasks');
      if (maps != null) {
        setState(() {
          tasks = List.generate(maps.length, (i) {
            return TasksModel.fromMap(maps[i]);
          });
        });
        print('Tasks loaded successfully: ${tasks.length} tasks found.');
        _scheduleTaskNotifications();
      } else {
        print('No tasks found in the database.');
      }
    } catch (e) {
      print('Error loading tasks: $e');
    }
  }

  Future<void> _scheduleTaskNotifications() async {
    for (var task in tasks) {
      try {
        final tz.TZDateTime scheduledDate =
        tz.TZDateTime.parse(tz.local, task.dateEnd);
        final tz.TZDateTime now = tz.TZDateTime.now(tz.local);

        print('Current time: $now');
        print('Scheduled time for ${task.title}: $scheduledDate');

        if (scheduledDate.isAfter(now)) {
          await flutterLocalNotificationsPlugin.zonedSchedule(
            task.id!,
            'Task Reminder',
            'It\'s time for your task: ${task.title}',
            scheduledDate,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                'task_notification_channel_id',
                'Task Notifications',
                channelDescription: 'This channel is used for task reminders',
                importance: Importance.max,
                priority: Priority.high,
              ),
            ),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
          );
          print('Notification scheduled successfully for task: ${task.title}');
        } else {
          print(
              'Scheduled time for task "${task.title}" is in the past. Skipping.');
        }
      } catch (e) {
        print('Error scheduling notification for task "${task.title}": $e');
      }
    }
  }

  String _getRemainingTime(String dateEnd) {
    final tz.TZDateTime scheduledDate = tz.TZDateTime.parse(tz.local, dateEnd);
    final Duration difference =
    scheduledDate.difference(tz.TZDateTime.now(tz.local));
    if (difference.isNegative) {
      return 'Time passed';
    } else {
      return '${difference.inHours}h ${difference.inMinutes % 60}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ProjectColors.mainColor,
        title: Text('الإشعارات'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _loadTasks,
            child: Text('تحديث المهام'),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('عنوان المهمة')),
                    DataColumn(label: Text('وقت المهمة')),
                    DataColumn(label: Text('الوقت المتبقي')),
                  ],
                  rows: tasks.map((task) {
                    return DataRow(cells: [
                      DataCell(Text(task.title)),
                      DataCell(Text(task.dateEnd)),
                      DataCell(Text(_getRemainingTime(task.dateEnd))),
                    ]);
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}












//
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
//
// import '../../../core/shared/colors.dart';
//
// class Notifications extends StatefulWidget {
//   const Notifications({super.key});
//
//   @override
//   _NotificationsState createState() => _NotificationsState();
// }
//
// class _NotificationsState extends State<Notifications> {
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   @override
//   void initState() {
//     super.initState();
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//     AndroidInitializationSettings('app_icon');
//     final InitializationSettings initializationSettings =
//     InitializationSettings(android: initializationSettingsAndroid);
//     flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       // onSelectNotification: (String? payload) async {
//       //   // Handle notification tapped logic here
//       // },
//     );
//
//     tz.initializeTimeZones();
//   }
//
//   void _scheduleDailyNotification() async {
//     await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'Daily Notification',
//       'This is your daily notification at 5:25 PM',
//       _nextInstanceOfFiveTwentyFivePM(),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//           'daily_notification_channel_id',
//           'Daily Notifications',
//           importance: Importance.max,
//           priority: Priority.high,
//         ),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//       UILocalNotificationDateInterpretation.wallClockTime,
//       matchDateTimeComponents: DateTimeComponents.time,
//     );
//   }
//
//   tz.TZDateTime _nextInstanceOfFiveTwentyFivePM() {
//     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
//     tz.TZDateTime scheduledDate =
//     tz.TZDateTime(tz.local, now.year, now.month, now.day, 17, 59);
//     if (scheduledDate.isBefore(now)) {
//       scheduledDate = scheduledDate.add(const Duration(days: 1));
//     }
//     return scheduledDate;
//   }
//
//   void _showNotification() async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//     AndroidNotificationDetails(
//       'your_channel_id',
//       'your_channel_name',
//       channelDescription: 'your_channel_description',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: false,
//     );
//     const NotificationDetails platformChannelSpecifics =
//     NotificationDetails(android: androidPlatformChannelSpecifics);
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Test Notification',
//       'This is a test notification',
//       platformChannelSpecifics,
//       payload: 'item x',
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: ProjectColors.mainColor,
//         title: Text('الاشعارات'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: _showNotification,
//           child: Text('إرسال إشعار'),
//         ),
//       ),
//     );
//   }
// }