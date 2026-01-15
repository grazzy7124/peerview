import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/class_card.dart';

class ClassListPage extends StatefulWidget {
  const ClassListPage({super.key});

  @override
  State<ClassListPage> createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<Map<String, dynamic>> _classes = [
    {'className': '공학설계입문', 'headCount': 66},
    {'className': '오픈소스 스튜디오', 'headCount': 45},
    {'className': '모바일 앱 개발', 'headCount': 57},
  ];

  void _deleteClass(int index) {
    // 1) 지울 아이템을 미리 저장
    final removedItem = _classes[index];

    // 2) 데이터에서 제거
    _classes.removeAt(index);

    // 3) AnimatedList에 "삭제 애니메이션" 요청
    _listKey.currentState?.removeItem(index, (context, animation) {
      return _buildAnimatedItem(removedItem, animation);
    }, duration: const Duration(milliseconds: 220));
  }

  // ✅ 삭제/등장 애니메이션 공통 위젯
  Widget _buildAnimatedItem(
    Map<String, dynamic> item,
    Animation<double> animation,
  ) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      child: FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: ClassCard(
          className: item['className'],
          headCount: item['headCount'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 80),
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
              color: Color(0xff6A7282),
            ),
          ),
          Expanded(
            child: 
            GridView.count(
              primary: false,
              // padding: const EdgeInsets.all(20),
              crossAxisSpacing: 26,
              mainAxisSpacing: 24,
              crossAxisCount: 2,
              children: <Widget>[
                ClassCard(className: '공학설계입문', headCount: 66,),
                ClassCard(className: '오픈소스 스튜디오', headCount: 45,),
                ClassCard(className: '모바일 앱 개발', headCount: 57,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
