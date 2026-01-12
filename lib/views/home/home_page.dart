import 'package:flutter/material.dart';
import 'package:peerview/core/theme/font_styles.dart';
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
            SizedBox(height: 45,),
            Text(
              '수업 생성하기'
            ),
            SizedBox(height: 21,),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => CreateClassPage())
                );
              },
              child: Container(
                width: double.infinity, height: 136,
                decoration: BoxDecoration(
                  color: Color(0xffE8EDFA),
                  borderRadius: BorderRadius.circular(13),
                  border: BoxBorder.all(
                    width: 2,
                    color: Color(0xffF7F7F7)
                  )
                ),
                child: Center(
                  child: SizedBox(
                    width: 25,
                    child: Image.asset('assets/images/plus_icon.png',)
                  ),
                ),
              ),
            ),
            SizedBox(height: 42,),
            Text('진행 중인 Peer Review'),
            SizedBox(height: 18,),

          ],
        ),
      ),
    );
  }
}