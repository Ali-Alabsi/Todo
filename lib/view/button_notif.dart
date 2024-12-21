
import 'package:flutter/material.dart';

import '../main.dart';
import 'notif.dart';

class LocalNotif extends StatefulWidget {
  const LocalNotif({Key? key}) : super(key: key);

  @override
  State<LocalNotif> createState() => _LocalNotifState();

}

class _LocalNotifState extends State<LocalNotif> {
  void initState(){
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ElevatedButton(child: Text('Button'),onPressed: (){
        Noti.showBigTextNotification(title: "New message title", body: "Your long body", fln: flutterLocalNotificationsPlugin);
      }),
    );
  }
}
