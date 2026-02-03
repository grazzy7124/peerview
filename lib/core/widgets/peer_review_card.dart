import 'package:flutter/material.dart';

class PeerReviewCard extends StatelessWidget {
  const PeerReviewCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 19),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
          border: Border.all(
            color: Color(0xffF3F4F6),
            width: 1.8
          ),
          borderRadius: BorderRadius.circular(24)
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(19),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '파이썬 프로그래밍',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                    )
                  ),
                  Spacer(),
                  Container(
                    width: 32, height: 18,
                    decoration: BoxDecoration(
                      color: Color(0xffFCD9DA),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(
                      child: Text(
                        'D-4',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 9,
                          color: Color(0xffEA0004)
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6,),
              Text(
                '팀 프로젝트 기말 평가',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Color(0xff666666)
                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text(
                    '평가 진행률',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '3/5명 완료',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 10,
                      color: Color(0xff164BC6)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 6,),
              Stack(
                children: [
                  Container(
                    height: 6,
                    decoration: BoxDecoration(
                      color: Color(0xffF7F7F7),
                      borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                  Container(
                    width: 200, height: 6,
                    decoration: BoxDecoration(
                      color: Color(0xff164BC6),
                      borderRadius: BorderRadius.circular(40)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14,),
              Material(
                color: Colors.transparent,
                child: Ink(
                  height: 28,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F7F7),
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: InkWell(
                    onTap: () {
                      
                    },
                    borderRadius: BorderRadius.circular(14),
                    child: Center(
                      child: Text('자세히 보기'),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
