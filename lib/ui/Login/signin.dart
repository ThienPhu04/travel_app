import 'package:flutter/material.dart';
import 'package:travel_app/ui/Login/forgotpw.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Đăng nhập",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '+84 ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.arrow_forward_ios, size: 16),
                    ],
                  ),
                ),
                hintText: 'Số điện thoại',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
          ),
          SizedBox(height: 20),

          // Password TextField
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            child: TextField(
              obscureText: true, // Hide password text
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(
                    Icons.visibility_off), // Eye icon to show/hide password
                hintText: 'Mật khẩu',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          // Forgot password link
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () {
                ForGot(context);
              },
              child: Text(
                'Quên mật khẩu?',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void ForGot(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Forgotpw()),
  );
}
