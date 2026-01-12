import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/class_card.dart';

class ClassListPage extends StatelessWidget {
  const ClassListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80,),
          Text(
            '내 수업 모아보기',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          Text(
            '함께 성장하는 동료 평가',
            style: TextStyle(
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Color(0xff6A7282)
            ),
          ),
          Expanded(
            child: GridView.count(
              primary: false,
              // padding: const EdgeInsets.all(20),
              crossAxisSpacing: 26,
              mainAxisSpacing: 24,
              crossAxisCount: 2,
              children: <Widget>[
                ClassCard(className: '공학설계입문', headCount: '66',),
                ClassCard(className: '오픈소스 스튜디오', headCount: '45',),
                ClassCard(className: '모바일 앱 개발', headCount: '57',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

