import 'package:flutter/material.dart';
import 'dart:ui';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
      children: [
        Positioned(
          left: -62,
          top: 435,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              width: 519, 
              height: 427,
              decoration: BoxDecoration(
                color: Color(0xFFCBDAFF), 
                borderRadius: BorderRadius.circular(9999), 
              ),
            ),
          ),
        ),
        Positioned(
          left: -62,
          top: 531,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              width: 519, 
              height: 427,
              decoration: BoxDecoration(
                color: Color(0xFF7EA4FB), 
                borderRadius: BorderRadius.circular(9999), 
              ),
            ),
          ),
        ),
        Positioned(
          left: -62,
          top: 613,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
            child: Container(
              width: 519, 
              height: 427,
              decoration: BoxDecoration(
                color: Color(0xFF164BC6), 
                borderRadius: BorderRadius.circular(9999), 
              ),
            ),
          ),
        ),
        Positioned(
          top: 193,
          left: 212,
          child: Image.asset('assets/images/login_icon.png', height: 49,),
        ),
        Positioned(
          top: 189,
          left: 1,
          child: 
            Text('peer', style: TextStyle(
              color: Color(0xffe5e5e5), 
              fontSize: 32, 
              fontWeight: FontWeight.w800, 
              fontFamily: 'RiaSans', 
            )
          ),
        ),
        Positioned(
          top: 296,
          left: 287,
          child: 
            Text('review', style: TextStyle(
              color: Color(0xffe5e5e5), 
              fontSize: 32, 
              fontWeight: FontWeight.w800, 
              fontFamily: 'RiaSans', 
            )
          ),
        ),
        Positioned(
          top: 242,
          left: 161,
          child: 
            Text('peerview', style: TextStyle(
              color: Color(0xffF6F8FF), 
              fontSize: 40, 
              fontWeight: FontWeight.w800, 
              fontFamily: 'RiaSans', 
              shadows: [Shadow(blurRadius: 4, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 4))]
            )
          ),
        ),
        Positioned(
          top: 224,
          left: 15,
          child: 
            Text('peerview', style: TextStyle(
              color: Color(0xff154bc6), 
              fontSize: 40, 
              fontWeight: FontWeight.w800, 
              fontFamily: 'RiaSans', 
              shadows: [Shadow(blurRadius: 4, color: Color.fromRGBO(0, 0, 0, 0.25), offset: Offset(0, 4))]
            )
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 718,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 54,
                  width: 300,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.541),
                      padding: const EdgeInsets.only(left: 18),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/role');
                    },
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(100)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(7, 7, 6.42, 6.42),
                            child: Image.asset('assets/images/google_login_icon.png', height: 20.58,),
                          )
                        ),
                        SizedBox(width: 11),
                        RichText(
                          text: TextSpan(
                            style: const TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.w500),
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
        ]
      )
    );
  }
}