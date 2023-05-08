import 'package:wesoftek/views/Admin/login/loginScreen.dart';
import 'package:wesoftek/views/Employee/loginScreen.dart';
import 'package:flutter/material.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  _CategorySelectionScreenState createState() => _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  ValueNotifier<String?> _selectedCategory = ValueNotifier<String?>('Business');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Please select a category:',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder<String?>(
                valueListenable: _selectedCategory,
                builder: (context, selectedCategory, child) {
                  return Column(
                    children: [
                      RadioListTile(
                        value: 'Business',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          _selectedCategory.value = value as String?;
                        },
                        title: Text('Business'),
                        subtitle: Text('View business information'),
                        secondary: Icon(Icons.business),
                        selected: selectedCategory == 'Business',
                        activeColor: Colors.black87,
                      ),
                      RadioListTile(
                        value: 'Company Employee',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          _selectedCategory.value = value as String?;
                        },
                        title: Text('Company Employee'),
                        subtitle: Text('View employee information'),
                        secondary: Icon(Icons.person),
                        selected: selectedCategory == 'Employee',
                        activeColor: Colors.black87,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedCategory == null
                            ? null
                            : () {
                          switch (selectedCategory) {
                            case 'Business':
                            // Redirect to business screen
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminLoginScreen()));
                              break;
                            case 'Company Employee':
                            // Redirect to employee screen
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                              break;
                          }
                        },
                        child: Text('Continue'),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black87,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
