import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final List<String> notifications = [    'Notification 1',    'Notification 2',    'Notification 3',    'Notification 4',    'Notification 5',  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7D2AE8),
      appBar: AppBar(
        title: Text('Notifications',style: TextStyle(fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87),),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey,
              Colors.lightBlueAccent,
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.notifications),
              title: Text(notifications[index]),
              subtitle: Text('Notification details here...'),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Delete notification
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
