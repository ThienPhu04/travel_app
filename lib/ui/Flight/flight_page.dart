import 'package:flutter/material.dart';
import "package:intl/intl.dart";
import 'package:travel_app/ui/Flight/flight_search_screen.dart';

class FlightPage extends StatefulWidget {
  @override
  _FlightPage createState() => _FlightPage();
}

class _FlightPage extends State<FlightPage> {
  int selectedTripType = 0; // 0 for one-way, 1 for round-trip, 2 for multi-city
  DateTime? _selectedDate; // Lưu trữ ngày được chọn
  int _adults = 1;
  int _children = 0;
  int _infants = 0;
  String _travelClass =
      "Phổ Thông"; // 0 for one-way, 1 for round-trip, 2 for multi-city
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Đặt vé"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle for Trip type (Một chiều, Khứ hồi, Nhiều thành phố)
            Container(
              alignment: Alignment(
                  BorderSide.strokeAlignCenter, BorderSide.strokeAlignCenter),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue, width: 1),
              ),
              child: ToggleButtons(
                isSelected: [
                  selectedTripType == 0,
                  selectedTripType == 1,
                  selectedTripType == 2
                ],
                onPressed: (int index) {
                  setState(() {
                    selectedTripType = index;
                  });
                },
                borderRadius: BorderRadius.circular(5),
                selectedColor: Colors.white,
                fillColor: Colors.blue,
                color: Colors.black,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Một chiều"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Khứ hồi"),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text("Nhiều thành phố"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            // Row for location details (Departure, Swap, Arrival)
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 1),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _locationDetail(
                          "TP. Hồ Chí Minh", "- Tất cả các sân bay"),
                      Icon(Icons.swap_horiz, color: Colors.blue, size: 24),
                      _locationDetail("Điện Biên Phủ", "- Tất cả các sân bay"),
                    ],
                  ),
                  SizedBox(height: 10),
                  _dateSection(),
                  SizedBox(height: 10),
                  _travelDetails(),
                ],
              ),
            ),
            Spacer(),
            // Search Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            FlightSearchScreen()), // Replace with actual screen
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Tìm kiếm',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Location detail widget
  Widget _locationDetail(String city, String airport) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          city,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          airport,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _dateSection() {
    return GestureDetector(
      onTap: () async {
        DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2100),
        );
        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          });
        }
      },
      child: Row(
        children: [
          Icon(Icons.calendar_today, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            _selectedDate != null
                ? DateFormat('EEE, dd MMM').format(_selectedDate!)
                : 'Chọn ngày',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _travelDetails() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Chọn hạng ghế
            DropdownButton<String>(
              value: _travelClass,
              items: <String>['Phổ Thông', 'Thương Gia', 'Hạng Nhất']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _travelClass = newValue!;
                });
              },
            ),
            // Chọn số lượng hành khách
            Row(
              children: [
                Text("Người lớn: $_adults"),
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    setState(() {
                      _adults++;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {
                      if (_adults > 1) _adults--;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Trẻ em: $_children"),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  _children++;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  if (_children > 0) _children--;
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Em bé: $_infants"),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                setState(() {
                  _infants++;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.remove_circle),
              onPressed: () {
                setState(() {
                  if (_infants > 0) _infants--;
                });
              },
            ),
          ],
        ),
      ],
    );
  }
}
