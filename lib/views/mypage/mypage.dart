import 'package:flutter/material.dart';
import 'package:peerview/core/widgets/alertDialog.dart';
import 'package:peerview/viewmodels/session_view_model.dart';
import 'package:peerview/views/mypage/mypage_edit.dart';
import 'package:provider/provider.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});

  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 87,),
            Padding(
              padding: const EdgeInsets.fromLTRB(23.99, 0, 23.99, 37),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffE8EDF9),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset('assets/images/mypage_icon.png', height: 40,),
                    ),
                  ),
                  SizedBox(width: 17,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('김교수', style: TextStyle(color: Color(0xff0a0a0a), fontSize: 18, fontWeight: FontWeight.w600),),
                      SizedBox(height: 5.81,),
                      Text('kgsuu@handong.ac.kr', style: TextStyle(color: Color(0xff6A7282), fontSize: 15, fontWeight: FontWeight.w400),),
                    ],
                  )
                ],
              ),
            ),
            Divider(height: 0, thickness: 1.18, color: Color(0xffE5E7EB),),
            SizedBox(height: 3,),
            Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => MypageEdit()
                      )
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/mypage_icon.png', height: 20, color: Color(0xff4A5565),),
                        SizedBox(width: 12,),
                        Text('내 정보 수정', style: TextStyle(color: Color(0xff101828), fontSize: 16, fontWeight: FontWeight.w400),),
                        SizedBox(width: 210,),
                        Image.asset('assets/images/mypage_arrow_icon.png', height: 20, color: Color(0xff99A1AF),),
                      ],
                    ),
                  ),
                ), 
                Divider(color: Color(0xffF3F4F6), thickness: 1.18,),
                InkWell(
                  onTap: () {
                    showCustomedDialog(
                      context, 
                      '정말 로그아웃하시겠습니까?', 
                      () async {
                        await context.read<SessionViewModel>().signOut();
                      }
                    );
                    // await context.read<SessionViewModel>().signOut();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 16, 0, 16),
                    child: Row(
                      children: [
                        Image.asset('assets/images/mypage_logout_icon.png', height: 20, color: Color(0xffFB2C36),),
                        SizedBox(width: 12,),
                        Text('로그아웃', style: TextStyle(color: Color(0xffFB2C36), fontSize: 16, fontWeight: FontWeight.w400),),
                        SizedBox(width: 231,),
                        Image.asset('assets/images/mypage_arrow_icon.png', height: 20, color: Color(0xff99A1AF),),
                      ],
                    ),
                  ),
                ), 
                Divider(color: Color(0xffF3F4F6), thickness: 1.18,),
              ],
            )
          ],
        ),

      )
    );
  }
}