// lib/homepage.dart

import 'package:flutter/material.dart';
import 'package:travel_app/page/message_page.dart';
import 'package:travel_app/page/travel_page.dart';
import 'package:travel_app/page/user_profile.dart';

import '../page/homepage_content.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Tạo TextEditingController để thu thập đầu vào của người dùng
  TextEditingController _locationController = TextEditingController();
  int _selectedIndex = 0;

  // Danh sách các trang để chuyển đổi khi nhấn vào một mục trong thanh điều hướng dưới cùng
  final List<Widget> _pages = [
    HomepageContent(), 
    MessagePage(),
    TravelPage(), 
    UserProfile(), 
  ];

  // Phương thức xử lý khi nhấn vào các mục trong thanh điều hướng dưới cùng
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Cập nhật chỉ mục đã chọn để chuyển đổi trang
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hiển thị trang hiện đang được chọn từ danh sách _pages
      body: SafeArea(child: _pages[_selectedIndex]),

      // Thêm thanh điều hướng dưới cùng
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        // Tab hiện đang được chọn
        onTap: _onItemTapped, // Xử lý khi nhấn vào tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
            ),
            label: 'Trang chủ',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat_bubble_outlined,
              size: 30,
            ),
            label: 'Tin nhắn',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
              size: 30,
            ),
            label: 'Chuyến đi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
            ),
            label: 'Tài khoản',
          ),
        ],
        type: BottomNavigationBarType
            .fixed, // Hiển thị tất cả các mục một cách đều nhau
      ),
    );
  }

  @override
  void dispose() {
    _locationController.dispose();
    super.dispose();
  }
}
