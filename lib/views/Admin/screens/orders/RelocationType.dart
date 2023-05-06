import 'package:wesoftek/views/Admin/screens/orders/homeRelocation.dart';
import 'package:flutter/material.dart';
import 'officeRelocation.dart';

class Relocation extends StatefulWidget {
  const Relocation({Key? key}) : super(key: key);

  @override
  _RelocationState createState() => _RelocationState();
}

class _RelocationState extends State<Relocation> {
  ValueNotifier<String?> _selectedCategory = ValueNotifier<String?>('Business');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.black87,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Types of Relocation',
                style: TextStyle(fontSize: 30,
                fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ValueListenableBuilder<String?>(
                valueListenable: _selectedCategory,
                builder: (context, selectedCategory, child) {
                  return Column(
                    children: [
                      RadioListTile(
                        value: 'Home_Relocation',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          _selectedCategory.value = value as String?;
                        },
                        title: Text('Home Relocation'),
                        secondary: Icon(Icons.home),
                        selected: selectedCategory == 'Home_Relocation',
                        activeColor: Colors.white,
                      ),
                      RadioListTile(
                        value: 'Office_relocation',
                        groupValue: selectedCategory,
                        onChanged: (value) {
                          _selectedCategory.value = value as String?;
                        },
                        title: Text('Office Relocation'),
                        secondary: Icon(Icons.work),
                        selected: selectedCategory == 'Office_relocation',
                        activeColor: Colors.white,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: selectedCategory == null
                            ? null
                            : () {
                          switch (selectedCategory) {
                            case 'Home_Relocation':
                            // Redirect to business screen
                              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeRelocation()));
                              break;
                            case 'Office_relocation':
                            // Redirect to employee screen
                              Navigator.push(context, MaterialPageRoute(builder: (context) => OfficeRelocation()));
                              break;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.black87,
                        ),
                        child: Text('Continue'),
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


