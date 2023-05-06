import 'package:wesoftek/views/Admin/screens/orders/RelocationType.dart';
import 'package:wesoftek/views/Admin/screens/DAshScreen/analyticsScreen.dart';
import 'package:wesoftek/views/Admin/screens/customers/customerScreen.dart';
import 'package:wesoftek/views/Admin/screens/DAshScreen/feedbackScreeen.dart';
import 'package:wesoftek/views/Admin/screens/DAshScreen/managingEmployees.dart';
import 'package:wesoftek/views/Admin/screens/DAshScreen/notificationScreen.dart';
import 'package:wesoftek/views/Admin/screens/orders/orderScreen.dart';
import 'package:wesoftek/views/Admin/screens/DAshScreen/resetCurrentPassword.dart';
import 'package:flutter/material.dart';

class AdminDashboard extends StatefulWidget {

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[    Dashboard(),    Profile(),  ];

  void _onItemTapped(int index) {
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Profile(),
        ),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: Text('Admin Dashboard',
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
          color: Colors.black87),),
        backgroundColor: Colors.grey,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ),
              onPressed: () {
                // Add your chat functionality here
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationScreen(),
                ));}),
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Relocation(),
                    ));
              }),
        ],
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
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard,color: Colors.black87,),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.black87,),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightBlueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
          padding: EdgeInsets.all(40.0),
          crossAxisCount: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          children: <Widget>[
            _buildCard('Employees', Icons.person_outline, context,EmployeeManager()),
            _buildCard('Orders', Icons.shopping_basket_outlined, context,Enquires()),
            _buildCard('Feedback', Icons.feedback_outlined, context,FeedbackScreen()),
            _buildCard('Analytics', Icons.analytics_outlined, context,AnalyticsScreen()),
            _buildCard('Customer', Icons.person, context,CustomerDetailsScreen()),
          ],
        );
  }

  Widget _buildCard(String title, IconData icon, BuildContext context,Widget screen) {
    return GestureDetector(
      onTap: () {
        // Handle the on tap event
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(height: 20.0),
            Center(child: Text(title, style: Theme.of(context).textTheme.headline6)),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => screen),
                );
              },
              child: IconButton(
                icon: Icon(Icons.arrow_forward,size: 15.0,),
                onPressed: () {
                  // Handle the on pressed event
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => screen),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}


class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile',
          style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87),),
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResCurrPasswordScreen(),
                    ));
              }),
        ],
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
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://source.unsplash.com/random'),
              ),
              SizedBox(height: 16),
              Text(
                'John Doe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Divider(),
              SizedBox(height: 16),
              Text(
                'Email: johndoe@example.com',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 16),
              Text(
                'Phone: +1 (555) 555-1234',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


