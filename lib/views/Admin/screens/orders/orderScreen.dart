
import 'package:wesoftek/views/Admin/screens/orders/estimationCost.dart';
import 'package:flutter/material.dart';

class Enquires extends StatefulWidget {
  @override
  State<Enquires> createState() => _EnquiresState();
}

class _EnquiresState extends State<Enquires> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7D2AE8),
      appBar: AppBar(
        title: Text('Customer Enquires'),
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
          itemCount: 5, // replace with actual number of estimates
          itemBuilder: (context, index) {
            return Card(
                elevation: 2,
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                          begin: FractionalOffset(0.0, 0.0),
                          end: FractionalOffset(3.0, -1.0),
                          colors: [
                            Colors.transparent,
                            Colors.grey,
                            ])),
                  child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Customer ID',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'C213',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Customer Name',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'John Doe',
                              style: TextStyle(fontSize: 12.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'john.doe@example.com',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Origin',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text(
                              '123 Main St, Anytown, USA',
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 20),
                            if (_isExpanded) ...[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Destination',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                '456 Elm St, Anytown, USA',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Service type requested',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Household Relocation',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Volume of items to be moved',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '10',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Distance between the origin and destination',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                '50 km',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Date and time of the move',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'June 1, 2023 at 10:00 AM',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Special requests or notes',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Fragile items, please handle with care',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isExpanded = false;
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.cyan),
                                  ),
                                  child: Text(
                                    'View less',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )),
                            ] else ...[
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _isExpanded = true;
                                  });
                                },
                                style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(
                                      Colors.cyan),
                                ),
                                child: Text('View More',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ],
                            ElevatedButton(
                              onPressed: () {
                                // Calculate estimation cost here
                                // and show it in a dialog or a new screen
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EstimateCalculator(),
                                  ),
                                );
                              },
                              child: Text('Estimation Cost'),
                            ),
                          ])),
                ));
          },
        ),
      ),
    );
  }
}
