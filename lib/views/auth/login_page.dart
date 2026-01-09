import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 224,),
          Text('peerview', style: TextStyle(color: Color(0xff154bc6), fontSize: 40, fontWeight: FontWeight.w800, fontFamily: 'RiaSans', )),
          SizedBox(height: 300,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 54,
                width: 300,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromRGBO(245, 210, 210, 0.545),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }, 
                  child: 
                  Row(
                    children: [
                      // Image.asset('assets/images/google_login_icon.png', height: 50,),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(color: Color(0xff000000), fontSize: 15, fontWeight: FontWeight.w500),
                          children: [
                            const TextSpan(text: 'Google로 '),
                            TextSpan(text: 'peerview ', style: TextStyle(color: Color(0xff154bc6), fontWeight: FontWeight.w800, fontFamily: 'RiaSans'),),
                            const TextSpan(text: '시작하기'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}