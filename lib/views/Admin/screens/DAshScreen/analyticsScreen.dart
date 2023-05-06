import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  @override
  _AnalyticsScreenState createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final List<Map<String, dynamic>> _dummyData = [    {      'title': 'Total Bookings',      'count': 342,      'icon': Icons.book_outlined,      'color': Colors.blue,    },    {      'title': 'Completed Bookings',      'count': 275,      'icon': Icons.check_circle_outline,      'color': Colors.green,    },    {      'title': 'Pending Bookings',      'count': 67,      'icon': Icons.warning_outlined,      'color': Colors.red,    },    {      'title': 'Revenue',      'count': '\$135,800',      'icon': Icons.attach_money_outlined,      'color': Colors.purple,    },  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Analytics',
          style: TextStyle(fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black87),),
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Container(
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
        child: GridView.count(
          padding: EdgeInsets.all(16.0),
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: _dummyData.map((data) {
            return Card(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  // TODO: Handle card tap event
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        data['icon'],
                        color: data['color'],
                        size: 40.0,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        data['title'],
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 16.0),
                      Text(
                        data['count'].toString(),
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: data['color'],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
