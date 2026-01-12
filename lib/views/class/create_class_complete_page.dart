import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';

class CreateClassCompletePage extends StatelessWidget {
  const CreateClassCompletePage({super.key, required this.className});

  final String className;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 148,),
            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset(
                'assets/images/complete_icon.png',
                width: 96,
              ),
            ),
            SizedBox(height: 32,),
            Text(
              '수업이 생성되었습니다.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 28
              ),
            ),
            SizedBox(height: 10,),
            Text(
              className,
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff6A7282)
              ),
            ),
            SizedBox(height: 112,),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xff164BC6),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  '설문 생성하기',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              )
            ),
            SizedBox(height: 12,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(0xffE5E7EB),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '홈 화면으로 가기',
                    style: TextStyle(
                      
                    ),
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}