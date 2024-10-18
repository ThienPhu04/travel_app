import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/image/img_3.png'),
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.blueAccent, // Moved color here
              border:
                  Border.all(width: 1, color: Colors.black), // Đường viền đen
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Tiếp Tục Với Google",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black, // Moved color here
              border:
                  Border.all(width: 1, color: Colors.black), // Đường viền đen
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Đăng nhập với số điện thoại",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
