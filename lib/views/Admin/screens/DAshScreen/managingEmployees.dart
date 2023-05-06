import 'package:flutter/material.dart';

class Employee {
  final String name;
  // final String status;
  final String role;

  Employee({required this.name,required this.role});
}

class EmployeeManager extends StatefulWidget {
  @override
  _EmployeeManagerState createState() => _EmployeeManagerState();
}

class _EmployeeManagerState extends State<EmployeeManager> {
  List<Employee> employees = [
    Employee(name: 'John Smith',role: 'Employee'),
    Employee(name: 'Jane Doe',role: 'Manager'),
    Employee(name: 'Bob Johnson',role: 'Admin'),
  ];

  void addEmployee(String name,String role) {
    setState(() {
      employees.add(Employee(name: name, role: role));
    });
  }

  void removeEmployee(Employee employee) {
    setState(() {
      employees.remove(employee);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7D2AE8),
      appBar: AppBar(
        title: Text('Employee Managing',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
          color: Colors.black,
        ),),
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
        child: ListView.builder(
          itemCount: employees.length,
          itemBuilder: (context, index) {
            Employee employee = employees[index];
            return ListTile(
              title: Text(employee.name),
              subtitle: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(employee.role),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeEmployee(employee),
              ),
            );
          },
        ),
      ),);
  }
}
