import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9FAFB),
      appBar: AppBar(
        // backgroundColor: Colors.amber,
        title: Text(
          '평가 결과'
        ),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 10), 
          child: Divider(
            color: Color(0xffE5E7EB),
            height: 0,
            thickness: 0.65,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  bottom: BorderSide(
                    width: 0.65,
                    color: Color(0xffE5E7EB),
                  )
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 24, bottom: 20, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '2024-2학기 중간 동료평가'
                    ),
                    Text(
                      '공학설계입문'
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}