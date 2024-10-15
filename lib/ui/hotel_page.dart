import 'package:flutter/material.dart';

class HotelPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chỗ ở"),
        backgroundColor: Colors.cyan,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Thêm khoảng cách xung quanh
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Nhập chỗ cần tìm',
                        prefixIcon:
                            Icon(Icons.search), // Thêm icon vào bên trái
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
