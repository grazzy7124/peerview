import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/alertDialog.dart';
import 'package:peerview/views/class/class_list_page.dart';
import 'package:peerview/views/survey/edit_team_page.dart';

class SurveyCard extends StatefulWidget {
  const SurveyCard({
    super.key,
    this.surveyName = 'surveyName',
    this.headCount = 0,
    this.dueDate = '2026.01.12',
    required this.onDelete,
  });

  final String surveyName;
  final int headCount;
  final String dueDate;
  final VoidCallback onDelete;

  @override
  State<SurveyCard> createState() => _SurveyCardState();
}

class _SurveyCardState extends State<SurveyCard> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: AnimatedSize(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeInOut,
        alignment: Alignment.topCenter,
        child: Container(
          width: 340,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: const Color(0xffE5E7EB), width: 0.65),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      widget.surveyName,
                      style: const TextStyle(
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'delete') {
                          showCustomedDialog(
                            context,
                            '해당 설문을 삭제하시겠습니까?',
                            widget.onDelete,
                          );
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem<String>(
                          height: 30,
                          value: 'delete',
                          child: Center(
                            child: Text(
                              '삭제하기',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      offset: const Offset(0, 20),
                      color: Colors.white,
                      child: const SizedBox(
                        width: 15,
                        height: 15,
                        child: Image(
                          image: AssetImage('assets/images/hamburger_icon.png'),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),

                const SizedBox(height: 18),

                IntrinsicHeight(
                  child: Row(
                    children: [
                      Text('참여자 ${widget.headCount}명'),
                      const VerticalDivider(
                        indent: 4,
                        endIndent: 4,
                        color: Color(0xffD1D5DC),
                      ),
                      Text('마감 ${widget.dueDate}'),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // ✅ 메인 버튼 (탭하면 텍스트 변경 + 확장)
                Button(
                  fillColor: const Color(0xff164BC6),
                  strokeColor: const Color(0xff164BC6),
                  labelColor: Colors.white,
                  label: _isExpanded ? '결과 확인' : '자세히 보기',
                  onTap: _toggleExpanded,
                ),

                // ✅ 확장됐을 때만 아래 버튼 2개 추가
                if (_isExpanded) ...[
                  const SizedBox(height: 12),
                  Column(
                    children: [
                      Button(
                        fillColor: Colors.white,
                        strokeColor: Color(0xffE5E7EB),
                        labelColor: Color(0xff111827),
                        label: '설문 수정',
                        onTap: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(builder: (context) => EditTeamPage())
                          );
                        },
                      ),
                      
                      const SizedBox(height: 10),

                      Button(
                        fillColor: Color(0xffF3F4F6),
                        strokeColor: Color(0xffE5E7EB),
                        labelColor: Color(0xff111827),
                        label: '공유하기',
                        onTap: () {
                          
                        },
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.fillColor,
    required this.strokeColor,
    required this.labelColor,
    required this.label,
    this.onTap
  });

  final Color fillColor;
  final Color strokeColor;
  final Color labelColor;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(10);

    return Material(
      color: Colors.transparent,
      child: Ink(
        height: 42,
        decoration: BoxDecoration(
          color: fillColor,
          border: Border.all(color: strokeColor, width: 1.33),
          borderRadius: radius,
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: labelColor),
            ),
          ),
        ),
      ),
    );
  }
}
