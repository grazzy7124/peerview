import 'package:flutter/material.dart';
import 'dart:ui';


class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
      children: [
        Align(
          alignment: Alignment(0, 1),
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              width: 519,
              height: 383,
              decoration: BoxDecoration(
                color: Color(0xFFCBDAFF),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 104,),
              Text('peerview', style: TextStyle(color: Color(0xff154bc6), fontSize: 24, fontWeight: FontWeight.w800, fontFamily: 'RiaSans')),
              SizedBox(height: 40),
              Text('이용하실 역할을 선택해주세요.', style: TextStyle(color: Color(0xff555555), fontSize: 12, fontWeight: FontWeight.w400)),
              SizedBox(height: 8,),
              Text('어떤 입장으로 peerview를 사용하시나요?', style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 47,),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                    },
                    child: Container(
                      color: Color.fromRGBO(255, 255, 255, 0.001),
                    ),

                  )
                ],
              )
            ],
          ),
        ),
        ]
      )
    );
  }
}