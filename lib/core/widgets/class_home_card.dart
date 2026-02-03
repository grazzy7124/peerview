import 'dart:ui';
import 'package:flutter/material.dart';

class ClassHomeCard extends StatelessWidget {
  const ClassHomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 13),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          width: 145, height: 145,
          decoration: BoxDecoration(
            color: Color(0xffEFF6FF),
            border: Border.all(
              color: Color(0xffDEECFF),
              width: 1
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              
            },
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    width: 37,
                    'assets/images/class_icon_1.png'
                  ),
                  SizedBox(height: 20,),
                  Text(
                    '파이썬 프로그래밍',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                      letterSpacing: -0.23
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    '45명',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}