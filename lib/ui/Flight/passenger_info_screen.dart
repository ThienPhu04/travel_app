import 'package:flutter/material.dart';
import 'package:travel_app/ui/Flight/flight_details_screen.dart';
import 'package:travel_app/ui/Flight/flight_page.dart';
import 'package:travel_app/ui/Flight/flight_search_screen.dart';
import 'package:travel_app/ui/Flight/payment_screen_state.dart';

class PassengerInfoScreen extends StatefulWidget {
  @override
  _PassengerInfoScreenState createState() => _PassengerInfoScreenState();
}

class _PassengerInfoScreenState extends State<PassengerInfoScreen> {
  // Text controllers to handle form inputs
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize with some default values
    nameController.text = 'CU QUANG TUOI';
    phoneController.text = '+84 328220703';
    emailController.text = 'cuquangtuoi11@gmail.com';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nhập Thông Tin'),
        centerTitle: true,
        actions: [
          Icon(Icons.info_outline),
          SizedBox(width: 10),
          Icon(Icons.more_horiz),
          SizedBox(width: 10),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flight Information section
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.flight_takeoff, color: Colors.blueAccent),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Chiều đi TP. Hồ Chí Minh - Điện Biên Phủ\nT7, 12 thg 10 19:00 - 14:00 +1',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Thông báo',
                          style: TextStyle(color: Colors.blueAccent)),
                      Text('Hành lý & Chính sách',
                          style: TextStyle(color: Colors.blueAccent)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Passenger Section
            Text('Hành khách',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Handle add passenger action
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blueAccent),
                ),
                child: Center(
                  child: Text(
                    '+ Thêm Hành Khách',
                    style: TextStyle(fontSize: 16, color: Colors.blueAccent),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Contact Information Section
            Text('Liên hệ',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Tên liên hệ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Price and Continue Button Section
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Giá trung bình cho mỗi người',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    'AED 1.567',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Continue Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PaymentScreen()), // Replace with actual screen
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                backgroundColor: Colors.blueAccent,
              ),
              child: Text('Tiếp tục', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
