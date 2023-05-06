import 'package:flutter/material.dart';

class EstimateCalculator extends StatefulWidget {

  @override
  _EstimateCalculatorState createState() => _EstimateCalculatorState();
}

class _EstimateCalculatorState extends State<EstimateCalculator> {
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  double _totalCost = 0.0;

  void _calculateCost() {
    double volume = double.parse(_volumeController.text);
    double distance = double.parse(_distanceController.text);
    _totalCost = volume * distance * 0.5; // replace with your own cost calculation formula
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Estimate Calculator'),
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Estimation Calculator',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 20),),
              SizedBox(height: 40,),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _volumeController,
                  decoration: InputDecoration(
                    labelText: 'Volume of Items (cubic meters)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _distanceController,
                  decoration: InputDecoration(
                    labelText: 'Distance (kilometers)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: _calculateCost,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Colors.black87,
                ),
                child: Text('Calculate Cost'),
              ),
              SizedBox(height: 16.0),
              Text('Total Cost: \$$_totalCost', style: TextStyle(fontSize: 24.0,
              fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
