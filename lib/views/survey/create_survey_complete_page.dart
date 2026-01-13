import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';

class CreateSurveyCompletePage extends StatelessWidget {
  const CreateSurveyCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 273,),
            Align(
              alignment: AlignmentGeometry.center,
              child: Image.asset(
                'assets/images/complete_icon.png',
                width: 96,
              ),
            ),
            SizedBox(height: 32,),
            Text(
              '설문이 등록 되었습니다!',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                fontSize: 28
              ),
            ),
            SizedBox(height: 13,),
            Text(
              '이제 학생들이 동료 평가를 작성할 수 있어요.',
              style: TextStyle(
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff6A7282)
              ),
            ),
          ],
        ),
      ),
    );
  }
}