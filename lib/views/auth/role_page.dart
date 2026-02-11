import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:peerview/viewmodels/session_view_model.dart';



class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  bool isAdminSelected = false;
  bool isStudentSelected = false;
  bool isRoleSelected() {
    return isAdminSelected || isStudentSelected;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
      children: [
        Positioned(
          top: 614.97,
          left: -63,
          child: ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(
              width: 519,
              height: 383,
              decoration: BoxDecoration(
                color: Color(0xFFCBDAFF),
                borderRadius: BorderRadius.circular(9999),
              ),
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 104,),
              Text('peerview', style: TextStyle(color: Color(0xff154bc6), fontSize: 24, fontWeight: FontWeight.w800, fontFamily: 'RiaSans')),
              SizedBox(height: 40),
              Text('이용하실 역할을 선택해주세요.', style: TextStyle(color: Color(0xff555555), fontSize: 12, fontWeight: FontWeight.w400)),
              SizedBox(height: 8,),
              Text('어떤 입장으로 peerview를 사용하시나요?', style: TextStyle(color: Color(0xff000000), fontSize: 16, fontWeight: FontWeight.w500)),
              SizedBox(height: 47,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isAdminSelected = true;
                          isStudentSelected = false;
                        });
                      },
                      child: Container(
                        width: 165,
                        height: 250,
                        decoration: BoxDecoration(
                          color: isAdminSelected
                            ? Color(0xff2E5BC3)
                            : Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.33),
                              spreadRadius: 0,
                              blurRadius: 10.2,
                              offset: Offset(0, 6.5),
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              spreadRadius: 0,
                              blurRadius: 9.1,
                              offset: Offset(0, -3.5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 23,),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.20),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 0.5),
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.04),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(8, 8, 7.93, 7.93),
                                child: Image.asset('assets/images/admin_role_icon.png', height: 64.07,),
                              )
                            ),
                            SizedBox(height: 17.4,),
                            Text('관리자', style: TextStyle(
                              color: isAdminSelected
                              ? Color(0xffffffff)
                              : Color(0xff164BC6),
                              fontSize: 16, fontWeight: FontWeight.w800,)
                            ),
                            Text('(교수 · TA)', style: TextStyle(
                              color: isAdminSelected
                                ? Color(0xffffffff)
                                : Color(0xff164BC6),
                              fontSize: 13, fontWeight: FontWeight.w600,)
                              ),
                            SizedBox(height: 25.7,),
                            Text('수업, 동료 평가 생성 및 관리', style: TextStyle(
                              color: isAdminSelected
                                ? Color(0xffffffff)
                                : Color(0xff164BC6),
                              fontSize: 12, fontWeight: FontWeight.w400,)
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isStudentSelected = true;
                          isAdminSelected = false;
                        });
                      },
                      child: Container(
                        width: 165,
                        height: 250,
                        decoration: BoxDecoration(
                          color: isStudentSelected
                            ? Color(0xff2E5BC3)
                            : Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.33),
                              spreadRadius: 0,
                              blurRadius: 10.2,
                              offset: Offset(0, 6.5),
                            ),
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.25),
                              spreadRadius: 0,
                              blurRadius: 9.1,
                              offset: Offset(0, -3.5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 23,),
                            Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.20),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 0.5),
                                  ),
                                  BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.04),
                                    spreadRadius: 0,
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15),
                                child: Image.asset('assets/images/student_role_icon.png', height: 50,),
                              )
                            ),
                            SizedBox(height: 17.4,),
                            Text('참여자', style: TextStyle(
                              color: isStudentSelected
                              ? Color(0xffffffff)
                              : Color(0xff164BC6), 
                              fontSize: 16, fontWeight: FontWeight.w800,)
                            ),
                            Text('(학생)', style: TextStyle(
                              color: isStudentSelected
                                ? Color(0xffffffff)
                                : Color(0xff164BC6), 
                              fontSize: 13, fontWeight: FontWeight.w600,)
                            ),
                            SizedBox(height: 25.7,),
                            Text('참여한 수업의 \n동료평가 설문에 참여', textAlign: TextAlign.center, style: TextStyle(
                              color: isStudentSelected
                                ? Color(0xffffffff)
                                : Color(0xff164BC6), 
                              fontSize: 12, fontWeight: FontWeight.w400,)
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 226,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29),
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: isRoleSelected()
                      ? Color(0xff164BC6)
                      :Color.fromRGBO(255, 255, 255, 0.2),
                    padding: const EdgeInsets.fromLTRB(0, 14.4, 0, 14.4),
                  ),
                  onPressed: (isAdminSelected || isStudentSelected)
                    ? () async {
                        try {
                          final role = isAdminSelected ? 'admin' : 'student';

                          await context.read<SessionViewModel>().chooseRoleAndCreateUser(role);

                          if (!mounted) return;

                          //  Gate로 보내면 admin/student에 따라 자동 홈 분기됨
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            '/gate',
                            (route) => false,
                          );
                        } catch (e) {
                          debugPrint('Role save error: $e');
                        }
                      }
                    : null,
                    child: Container(
                      height: 54, width: 335,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: isRoleSelected()
                              ? Color.fromRGBO(0, 0, 0, 0.2)
                              : Color(0xff8E9CBE),
                            spreadRadius: 0,
                            blurRadius: 10.9,
                            offset: Offset(0, 2),
                          ),
                        ]
                      ),
                      child: Image.asset(
                        isRoleSelected()
                          ? 'assets/images/role_select_btn_active.png'
                          : 'assets/images/role_select_btn.png', 
                          fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]
      )
    );
  }
}