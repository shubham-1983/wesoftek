import 'package:wesoftek/views/Admin/loginScreen.dart';
import 'package:flutter/material.dart';

class ResCurrPasswordScreen extends StatefulWidget {
  const ResCurrPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResCurrPasswordScreenState createState() => _ResCurrPasswordScreenState();
}

class _ResCurrPasswordScreenState extends State<ResCurrPasswordScreen> {
  late TextEditingController _currpasswordController;
  late TextEditingController _newpasswordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    _currpasswordController=TextEditingController();
    _newpasswordController = TextEditingController();
    _confirmPasswordController =TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _newpasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Enter Password'),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Reset your Password',
                style: TextStyle(fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(height: 60),
              TextField(
                controller: _newpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter Current password',
                    labelText: 'Current Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )                  ),
              ),
              SizedBox(height: 60),
              TextField(
                controller: _newpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Create new password',
                    labelText: 'New Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )                  ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Confirm New password',
                    labelText: 'Confirm Password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
              SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement password verification logic
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> AdminLoginScreen()));
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
