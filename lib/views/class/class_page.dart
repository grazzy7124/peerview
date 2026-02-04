import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/survey_card.dart';

class ClassPage extends StatefulWidget {
  const ClassPage({
    super.key,
    required this.className,
    this.classCode = 'classCode',
  });

  final String className;
  final String classCode;

  @override
  State<ClassPage> createState() => _ClassPageState();
}

class _ClassPageState extends State<ClassPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final List<Map<String, dynamic>> _surveys = [
    {'name': '2학기 중간 동료평가', 'headCount': 5, 'dueDate': '2026.01.12'},
    {'name': '2학기a료평가', 'headCount': 2, 'dueDate': '2026.01.12'},
    {'name': '2a료평가', 'headCount': 7, 'dueDate': '2026.01.12'},
    {'name': '2ddd가', 'headCount': 6, 'dueDate': '2026.01.12'},
    {'name': 'aaaaaaaaaaaaaa', 'headCount': 5, 'dueDate': '2026.01.12'},
    {'name': 'bbb', 'headCount': 5, 'dueDate': '2026.01.12'},
  ];

  void _deleteSurvey(int index) {
    // 1) 지울 아이템을 미리 저장
    final removedItem = _surveys[index];

    // 2) 데이터에서 제거
    _surveys.removeAt(index);

    // 3) AnimatedList에 "삭제 애니메이션" 요청
    _listKey.currentState?.removeItem(
      index,
      (context, animation) {
        return _buildAnimatedItem(removedItem, animation);
      },
      duration: const Duration(milliseconds: 220),
    );
  }

  //  삭제/등장 애니메이션 공통 위젯
  Widget _buildAnimatedItem(Map<String, dynamic> item, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
      child: FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
        child: SurveyCard(
          surveyName: item['name'],
          headCount: item['headCount'],
          dueDate: item['dueDate'],
          onDelete: () {}, // removeItem에서 보여주는 "가짜 위젯"이라 onDelete는 비워도 됨
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xffF9FAFB),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 72, bottom: 9),
                child: Row(
                  children: [
                    Text('코드: ${widget.classCode}'),
                  ],
                ),
              ),
              const Divider(
                color: Color(0xffE5E7EB),
                indent: 10,
                endIndent: 10,
                height: 0,
              ),
            ],
          ),
        ),
        title: Text(widget.className),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 10),
        child: AnimatedList(
          key: _listKey, 
          initialItemCount: _surveys.length,
          itemBuilder: (context, index, animation) {
            final s = _surveys[index];

            return SizeTransition(
              sizeFactor: CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              child: FadeTransition(
                opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
                child: SurveyCard(
                  surveyName: s['name'],
                  headCount: s['headCount'],
                  dueDate: s['dueDate'],
                  onDelete: () => _deleteSurvey(index),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
