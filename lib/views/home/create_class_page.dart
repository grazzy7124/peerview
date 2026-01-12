import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';

class CreateClassPage extends StatelessWidget {
  const CreateClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '수업을 생성하세요!',
                style: FontStyles.classFormTitle,
              ),
              Text(
                '수업 이름을 입력하세요',
                style: FontStyles.classFormBody1,
              ),
              TextField(

              ),
              Text(
                '수강자 인원 수',
                style: FontStyles.classFormBody1,
              ),
              TextField(

              ),
              Text(
                '팀 수',
                style: FontStyles.classFormBody1,
              ),
              TextField(

              ),

              Text(
                '코드 생성',
                style: FontStyles.classFormBody1,
              ),
              Container(
                width: double.infinity, height: 80,
                decoration: BoxDecoration(
                  color: Color(0xffF9FAFB),
                  border: BoxBorder.all(
                    color: Color(0xffE5E7EB),
                    width: 1.96
                  ),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    '생성된 코드가 여기에 표시됩니다',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xff9CA3AF)
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 71, height: 48,

                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}