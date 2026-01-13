import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';
import 'package:peerview/core/widgets/class_chip.dart';
import 'package:peerview/views/survey/survey_form_page.dart';

class SurveyPickClassPage extends StatefulWidget {
  const SurveyPickClassPage({super.key});

  @override
  State<SurveyPickClassPage> createState() => _SurveyPickClassPageState();
}

class _SurveyPickClassPageState extends State<SurveyPickClassPage> {
  int? selectedIndex;

  final List<String> classes = [
    '공학설계입문',
    '웹프로그래밍',
    'C프로그래밍',
    '자바 프로그래밍',
    '운영체제',
    '자료구조',
    '컴퓨터 및 전자학개론',
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 149),
          Text(
            '설문 생성할 수업을 선택해주세요',
            style: FontStyles.pickClassTitle,
          ),
          SizedBox(height: 75),
          SizedBox(
            width: double.infinity,
            height: 265,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(classes.length, (index) {
                  return ClassChip(
                    title: classes[index],
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex =
                          selectedIndex == index ? null : index;
                      });
                    },
                  );
                }),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 335,
                  height: 50,
                  decoration: BoxDecoration(
                    color: selectedIndex != null
                      ? const Color(0xff164BC6)
                      : const Color(0xffE5E7EB),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextButton(
                    onPressed: selectedIndex == null
                      ? null
                      : () {
                        Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(
                            builder: (_) => const SurveyFormPage(),
                          ),
                        );
                      },
                    child: Text(
                      '생성하기',
                      style: TextStyle(
                        color: selectedIndex != null
                            ? Color(0xffffffff)
                            : const Color(0xff9ca3af),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 32),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
