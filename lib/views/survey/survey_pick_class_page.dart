import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';
import 'package:peerview/core/widgets/class_chip.dart';

class SurveyPickClassPage extends StatelessWidget {
  const SurveyPickClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 149,),
          Text(
            '설문 생성할 수업을 선택해주세요',
            style: FontStyles.pickClassTitle,
          ),
          
          SizedBox(height: 75,),
          
          Container(
            width: double.infinity, height: 265,
            // color: Colors.amber,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),
                  ClassChip(),                  
                ],
              ),
            ),
          ),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 335, height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(8)
                  ),
                ),
                SizedBox(height: 32,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

