import 'package:flutter/material.dart';
import 'package:travel_app/ui/partner_page.dart';
import 'package:travel_app/ui/ticket_page.dart';
import 'package:travel_app/ui/tour_page.dart';
import 'package:travel_app/ui/train_page.dart';
import '../ui/combo_page.dart';
import '../ui/flight_page.dart';
import '../ui/flight_status_page.dart';
import '../ui/hotel_page.dart';

class HomepageContent extends StatelessWidget {
  final TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Lấy chiều rộng của màn hình
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          searchLocation(context, _locationController),
          Container(
            width: screenWidth,
            height: 200,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            decoration:
                const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCategoryColumn(context, Icons.home_work_rounded,
                        "Khách sạn", HotelPage()),
                    buildCategoryColumn(
                        context, Icons.flight, "Chuyến bay", FlightPage()),
                    buildCategoryColumn(
                        context, Icons.hotel, "Combo tiết kiệm", ComboPage()),
                    buildCategoryColumn(
                        context, Icons.train, "Vé tàu", TrainPage()),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildCategoryColumn(context, Icons.attractions_sharp,
                        "Tour& Hoạt động", TourPage()),
                    buildCategoryColumn(context, Icons.screen_search_desktop,
                        "Trạng thái chuyến bay", FlightStatusPage()),
                    buildCategoryColumn(
                        context, Icons.handshake, "Đối tác", PartnerPage()),
                    buildCategoryColumn(
                        context, Icons.title, "Vé Trip.com", TicketPage()),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 500,
            color: Colors.pink,
          ),
          Container(
            width: screenWidth,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: itemCategory()),
                    Expanded(child: itemCategory()),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: itemCategory()),
                    Expanded(child: itemCategory()),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // Phương thức trợ giúp để tạo một cột danh mục với văn bản và biểu tượng
  Widget buildCategoryColumn(
      BuildContext context, IconData icon, String label, Widget targetPage) {
    return Column(
      children: [
        IconButton(
          onPressed: () {
            // Điều hướng đến trang đích khi nhấn vào nút
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          icon: Icon(icon),
          color: Colors.lightBlue,
          iconSize: 28,
          tooltip: label, // Thêm chú thích để hỗ trợ truy cập
        ),
        Container(
          width: 80, // Đặt chiều rộng cố định để văn bản có thể xuống dòng
          child: Text(
            label,
            textAlign: TextAlign.center, // Căn giữa văn bản
            softWrap: true, // Cho phép văn bản xuống nhiều dòng
            maxLines: 2, // Giới hạn tối đa 2 dòng
            overflow:
                TextOverflow.ellipsis, // Thêm dấu ba chấm nếu văn bản quá dài
            style: TextStyle(fontSize: 12), // Điều chỉnh kích thước chữ nếu cần
          ),
        ),
      ],
    );
  }

  // Widget cho ô nhập tìm kiếm vị trí
  Widget searchLocation(
      BuildContext context, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 20.0), // Thêm khoảng cách xung quanh hàng
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            // Làm cho TextField chiếm hết không gian còn lại
            child: TextField(
              controller:
                  controller, // Sử dụng bộ điều khiển để thu thập đầu vào
              decoration: InputDecoration(
                hintText: "Nhập nơi bạn muốn tìm!",
                prefixIcon: Icon(Icons.search), // Biểu tượng tìm kiếm bên trái
                suffixIcon: Icon(Icons.text_fields,
                    color: Colors.orange), // Biểu tượng "T"
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemCategory() {
    return Column(
      children: [
        Container(
          height: 145,
        ),
        Text("Da Lat"),
        Text("298.563D"),
      ],
    );
  }
}
