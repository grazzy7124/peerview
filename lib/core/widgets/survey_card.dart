import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: 340, height: 168,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xffE5E7EB),
            width: 0.65
          ),
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    widget.surveyName,
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                  Expanded(child: Container()),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'delete') {
                        widget.onDelete();
                      }
                    },
                    itemBuilder: (context) => [
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
                    offset: Offset(0, 20),
                    color: Colors.white,
                    child: Container(
                      child: SizedBox(
                        width: 15,
                        height: 15,
                        child: Image.asset(
                          'assets/images/hamburger_icon.png',
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 8,),
                ],
              ),
              Expanded(child: Container()),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Text('참여자 ${widget.headCount}명'),
                    VerticalDivider(
                      indent: 4, endIndent: 4,
                      color: Color(0xffD1D5DC),
                    ),
                    Text('마감 ${widget.dueDate}')
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Button(
                fillColor: Color(0xff164BC6), 
                strokeColor: Color(0xff164BC6), 
                labelColor: Colors.white,
                label: '자세히 보기',
              )
            ],
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
    required this.label
  });

  final Color fillColor;
  final Color strokeColor;
  final Color labelColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 305, height: 42,
      decoration: BoxDecoration(
        color: fillColor,
        border: Border.all(
          color: strokeColor,
          width: 1.33,
        ),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Center(
        child: Text(
          label, 
          style: TextStyle(
            color: labelColor
          ),
        ),
      ),
    );
  }
}