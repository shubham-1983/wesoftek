
import 'package:wesoftek/views/Admin/screens/DAshScreen/DashScreen.dart';
import 'package:flutter/material.dart';

class HomeRelocation extends StatefulWidget {
  @override
  _HomeRelocationState createState() => _HomeRelocationState();
}

class _HomeRelocationState extends State<HomeRelocation> {
  String movingFrom = " ";
  String movingTo = " ";
  late DateTime shiftingDate = DateTime.now();
  late TimeOfDay shiftingTime = TimeOfDay.now();
  int roomConfig = 1;
  String itemsList = " ";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Survey',style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 28
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
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Moving From',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      )
                  )),
              onChanged: (value) {
                setState(() {
                  movingFrom = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Moving To',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.black87,
                      )
                  )),
              onChanged: (value) {
                setState(() {
                  movingTo = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Shifting Date'),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () async {
                final picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    shiftingDate = picked;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  shiftingDate == null
                      ? 'Select Shifting Date'
                      : '${shiftingDate.day}/${shiftingDate.month}/${shiftingDate.year}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Shifting Time'),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() {
                    shiftingTime = picked;
                  });
                }
              },
              child: Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text(
                  shiftingTime == null
                      ? 'Select Shifting Time'
                      : '${shiftingTime.hour}:${shiftingTime.minute}',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Text('Room Configuration'),
            SizedBox(height: 8.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('1 RK'),
                  Radio(
                    value: 2,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('1 BHK'),
                  Radio(
                    value: 3,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('2 BHK'),
                  Radio(
                    value: 4,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('3 BHK'),
                  Radio(
                    value: 5,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('4 BHK'),
                  Radio(
                    value: 6,
                    groupValue: roomConfig,
                    onChanged: (value) {
                      setState(() {
                        roomConfig = value!;
                      });
                    },
                  ),
                  Text('Villa'),
                ],
              ),
            ),
            TextButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return ItemListDialog();
                  });
            }, child: Text('Item List',style: TextStyle(color: Colors.black,
                fontWeight: FontWeight.bold),)),
            SizedBox(height: 8,),
            ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
// Implement submission logic here
                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDashboard()));

              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Colors.black87,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
                child: Text('Reset'),
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: Colors.black87,
    ),),
          ],
        ),
      ),
    );
  }
}


class ItemListDialog extends StatefulWidget {
  @override
  _ItemListDialogState createState() => _ItemListDialogState();
}

class _ItemListDialogState extends State<ItemListDialog> {
  List<Item> items = [
    Item('Double BED', 2),
    Item('AC', 1),
    Item('SOFA', 4),
    Item('Washing Machine', 4),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Item List'),
      content: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 40,
          columns: [
            DataColumn(label: Text('Item Name')),
            DataColumn(label: Text('Quantity')),
          ],
          rows: items.map((item) {
            return DataRow(
              cells: [
                DataCell(Text(item.name)),
                DataCell(
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (item.quantity > 0) {
                              item.quantity--;
                            }
                          });
                        },
                      ),
                      Text(item.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            item.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            addItemDialog();
          },
          child: Text('Add Item'),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Close'),
        ),
      ],
    );
  }

  void addItemDialog() {
    String itemName = '';
    int quantity = 0;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  itemName = value;
                },
                decoration: InputDecoration(
                  hintText: 'Enter item name',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  quantity = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter quantity',
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  items.add(Item(itemName, quantity));
                });
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

class Item {
  String name;
  int quantity;

  Item(this.name, this.quantity);
}