import 'package:flutter/material.dart';

import 'hotel_list.dart';

class SearchRoom extends StatefulWidget {
  const SearchRoom({super.key});

  @override
  State<SearchRoom> createState() => _SearchRoomState();
}

class _SearchRoomState extends State<SearchRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120.0), // Chiều cao AppBar
        child: AppBar(
          backgroundColor: Colors.blueAccent, // Màu nền xanh
          flexibleSpace: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Phần mũi tên quay lại và thông tin địa điểm
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      // Nút quay lại
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context); // Quay lại màn hình trước
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      // Thông tin ngày tháng và địa điểm
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '10 thg 10  -  11 thg 10',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Đà Lạt, Lâm Đồng, Việt Nam',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10), // Khoảng cách giữa các phần
                // Phần "Bộ lọc" và "Xếp theo"
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Bộ lọc
                      TextButton.icon(
                        onPressed: () {
                          // Xử lý khi nhấn "Bộ lọc"
                          setState(() {
                            // Cập nhật trạng thái nếu cần
                          });
                        },
                        icon: Icon(Icons.filter_list, color: Colors.white),
                        label: Text(
                          'Bộ lọc',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      // Xếp theo
                      TextButton.icon(
                        onPressed: () {
                          // Xử lý khi nhấn "Xếp theo"
                          setState(() {
                            // Cập nhật trạng thái nếu cần
                          });
                        },
                        icon: Icon(Icons.sort, color: Colors.white),
                        label: Text(
                          'Xếp theo',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: HotelList(
          hotels: [
            // Ví dụ dữ liệu khách sạn (thường lấy từ API)
            Hotel(
              name: 'Ánh Phương Hotel Đà Lạt',
              rating: 4.1,
              imageUrl: 'https://via.placeholder.com/150',
              originalPrice: 476233,
              discountedPrice: 209597,
              discountPercent: 54,
            ),
            Hotel(
              name: 'Khách sạn Hương Sen',
              rating: 4.5,
              imageUrl: 'https://via.placeholder.com/150',
              originalPrice: 500000,
              discountedPrice: 250000,
              discountPercent: 50,
            ),
            // Có thể thêm nhiều khách sạn khác tại đây...
          ],
        ),
      ),
    );
  }
}
