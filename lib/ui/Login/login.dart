import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/ui/singin.dart';
import 'package:url_launcher/url_launcher.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Centers content vertically
        children: [
          Image(
            image: AssetImage('assets/image/img_3.png'),
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 20), // Space between image and first button
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Remove rounded corners
                side: BorderSide(color: Colors.black, width: 1), // Border style
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                  70), // Set button size
            ),
            child: Text(
              "Tiếp Tục Với Google",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10), // Space between two buttons
          ElevatedButton(
            onPressed: () {
              // Add your onPressed logic here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero, // Remove rounded corners
                side: BorderSide(color: Colors.black, width: 1), // Border style
              ),
              minimumSize: Size(MediaQuery.of(context).size.width * 0.8,
                  70), // Set button size
            ),
            child: Text(
              "Tiếp Tục Với Với Số Điện Thoại",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 10),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Đăng ký tài khoản ',
                  style: TextStyle(color: Colors.black),
                ),
                TextSpan(
                  text: 'tại đây',
                  style: TextStyle(
                      color: Colors.blueAccent, fontWeight: FontWeight.bold),
                  recognizer: _tapGestureRecognizer
                    ..onTap = () {
                      SignIn(context);
                    },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void SignIn(BuildContext context) {
  // Chuyển hướng đến trang đăng nhập
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Signin()),
  );
}
