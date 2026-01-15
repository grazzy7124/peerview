import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/survey_card.dart';

class ClassPage extends StatelessWidget {
  const ClassPage({
    super.key,
    required this.className,
    this.classCode = 'classCode'
  });

  final String className;
  final String classCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: AppBar(
        backgroundColor: Color(0xffF9FAFB),
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 20), 
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 72, bottom: 9),
                child: Row(
                  children: [
                    Text(
                      '코드: ${classCode}'
                    ),
                  ],
                ),
              ),
              Divider(
                color: Color(0xffE5E7EB),
                indent: 10,
                endIndent: 10,
                height: 0,
              )
            ],
          )
        ),
        title: Text(className),
      ),

      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 24, right: 24, top: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SurveyCard(),
              SurveyCard(),
              SurveyCard(),
              SurveyCard(),
              SurveyCard(),
              SurveyCard(),
              SurveyCard(),
            ],
          ),
        ),
      ),
    );
  }
}

