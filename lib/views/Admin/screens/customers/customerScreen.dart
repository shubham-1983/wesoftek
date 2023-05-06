import 'package:wesoftek/views/Admin/screens/orders/RelocationType.dart';
import 'package:wesoftek/views/Admin/screens/customers/addCustomer.dart';
import 'package:flutter/material.dart';

class CustomerDetailsScreen extends StatefulWidget {
  @override
  State<CustomerDetailsScreen> createState() => _CustomerDetailsScreenState();
}

class _CustomerDetailsScreenState extends State<CustomerDetailsScreen> {

  String name = " ";
  String email = " ";
  String phoneNumber = " ";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Details',
          style: TextStyle(color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 20),),
        backgroundColor: Colors.grey,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddCustomerScreen(),
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        Card(
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
          'Name',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        Text('John Doe'),
        Text(
          'Email',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('johndoe@example.com'),
        Text(
          'Phone Number',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text('123-456-7890'),
        SizedBox(height: 16),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
        ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        backgroundColor: Colors.black87,
      ),
      onPressed: () {
        // TODO: Navigate to the surveys screen for this customer
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Relocation()));
      },
      icon: Icon(Icons.add),
      label: Text('Add Survey'),
    ),
    IconButton(
    icon: Icon(Icons.edit),
    onPressed: () {
    // Define the text editing controllers
    final nameController = TextEditingController(text: name);
    final emailController = TextEditingController(text: email);
    final phoneController = TextEditingController(text: phoneNumber);

    showDialog(
    context: context,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Edit Customer Details'),
    content: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
    TextField(
    controller: nameController,
    decoration: InputDecoration(
    labelText: 'Name',
    ),
    ),
    TextField(
    controller: emailController,
    decoration: InputDecoration(
    labelText: 'Email',
    ),
    ),
    TextField(
    controller: phoneController,
    decoration: InputDecoration(
    labelText: 'Phone Number',
    ),
    ),
    ],
    ),
    actions: <Widget>[
    TextButton(
    onPressed: () {
    // Cancel button pressed
    Navigator.of(context).pop();
    },
    child: Text('Cancel'),
    ),
    TextButton(
    onPressed: () {
    // Save button pressed
    setState(() {
    // Update the customer details
    name = nameController.text;
    email = emailController.text;
    phoneNumber = phoneController.text;
    });
    Navigator.of(context).pop();
    },
    child: Text('Save'),
    ),
    ],
    );
    },
    );
    },
    ),
    IconButton(
    icon: Icon(Icons.delete),
    onPressed:(){
    showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
    return AlertDialog(
    title: Text('Delete Customer Details'),
    content: SingleChildScrollView(
    child: ListBody(
    children: <Widget>[
    Text('Are you sure you want to delete the customer details?'),
    ],
    ),
    ),
    actions: <Widget>[
    TextButton(
    child: Text('Cancel'),
    onPressed: () {
    Navigator.of(context).pop();
    },
    ),
    TextButton(
    child: Text('Delete'),
    onPressed: () {
    // TODO: Delete the customer details
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    },
    ),
    ],
    );
    },
    );
    }
  ),
  ],
  ),

  ])))],

  )

  ,

  )

  ,

  );
}}
