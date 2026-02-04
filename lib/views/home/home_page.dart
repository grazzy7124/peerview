import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';
import 'package:peerview/core/widgets/class_home_card.dart';
import 'package:peerview/core/widgets/peer_review_card.dart';
import 'package:peerview/views/class/create_class_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 21, right: 21),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50,),
            Text(
              'peerview',
              style: FontStyles.logo,
            ),
            SizedBox(height: 34,),
            Container(
              height: 96,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: AlignmentGeometry.directional(0.1, 1),
                  colors: [
                    Color(0xff2453D9),
                    Color(0xff2B55DC),
                    Color.fromARGB(255, 94, 99, 235)
                  ]
                ),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(20),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '수업 생성하기',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                            fontSize: 17,
                            letterSpacing: -0.43,
                            color: Colors.white
                          ),
                        ),
                        SizedBox(height: 7,),
                        Text(
                          '새로운 강의를 생성하세요',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            letterSpacing: 0,
                            color: Colors.white
                          ),
                        )
                      ],
                    ),
                    Expanded(child: Container()),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder: (context) => CreateClassPage())
                        );
                      },
                      child: Image.asset(
                        'assets/images/join_class_icon.png',
                      ),
                    )
                  ],
                ),
              )
            ),
            SizedBox(height: 11,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClassHomeCard(),
                  ClassHomeCard(),
                  ClassHomeCard(),
                  ClassHomeCard(),
                  ClassHomeCard(),
                  ClassHomeCard(),
                  ClassHomeCard(),
                ],
              ),
            ),
            SizedBox(height: 39,),
            Text(
              '진행 중인 Peer Review',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17
              ),
            ),
            SizedBox(height: 9,),

            PeerReviewCard(),
            PeerReviewCard(),
            PeerReviewCard(),
          ],
        ),
      ),
    );
  }
}