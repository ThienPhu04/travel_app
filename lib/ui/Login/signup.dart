import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final TextEditingController _phoneController = TextEditingController();
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký'), // Tiêu đề trang đăng nhập
        backgroundColor: Colors.white70, // Màu của thanh AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Đăng ký",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              "Vui lòng nhập số điện thoại",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone, // Chỉ cho phép nhập số
            decoration: const InputDecoration(
              labelText: 'Số điện thoại',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.phone), // Biểu tượng số điện thoại
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Logic xử lý khi nhấn nút (ví dụ: xác thực số điện thoại)
              String phoneNumber = _phoneController.text;
              print('Số điện thoại: $phoneNumber'); // Chỉ để kiểm tra
            },
            style: ElevatedButton.styleFrom(
              minimumSize: Size(MediaQuery.of(context).size.width,
                  60), // Kích thước tối thiểu
              backgroundColor: Colors.blueAccent, // Màu nền của nút
              foregroundColor: Colors.white,
              // Màu chữ
            ),
            child: const Text(
              'Tiếp tục',
              style: TextStyle(fontSize: 20), // Kích thước chữ trong nút
            ),
          ),
          const SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Bạn chưa nhận được mã ? ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'Gửi lại mã',
                  style: const TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  recognizer: _tapGestureRecognizer..onTap = () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
