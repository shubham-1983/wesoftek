import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final List<String> _queries = [
    'What is the delivery time for my package?',
    'Can I change the delivery address of my package?',
    'How can I track the status of my package?',
  ];

  List<String> _managerResponses = ['', '', ''];
  List<TextEditingController> _responseTextControllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7D2AE8),
      appBar: AppBar(
        title: Text('Customer Queries',
          style: TextStyle(fontSize: 20,
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
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 0,
              color: Colors.transparent,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(
                  _queries[index],
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Query ID: ${index + 1}',
                      style: TextStyle(fontSize: 14),
                    ),
                    IconButton(
                      icon: Icon(Icons.quickreply,color: Colors.black,),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Want to response???'),
                              content: TextField(
                                controller: _responseTextControllers[index],
                                decoration: InputDecoration(
                                  hintText: 'Enter manager response',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.black87,
                                        )
                                    )                                ),
                                onChanged: (value) {
                                  _managerResponses[index] = value;
                                },
                              ),
                              actions: <Widget>[
                                TextButton(
                                  child: Text('Cancel',),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    backgroundColor: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  child: Text('Send',),
                                  onPressed: () {
                                    // Do something with the manager's response
                                    print(
                                        'Response sent: ${_managerResponses[index]}');
                                    // Clear the text field
                                    _responseTextControllers[index].clear();
                                    Navigator.of(context).pop();
                                    // Code to send the manager response to the customer
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    backgroundColor: Colors.black87,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}