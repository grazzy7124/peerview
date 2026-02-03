import 'package:flutter/material.dart';

class FontStyles {

  static const String pretendard = 'Pretendard';
  static const String riasans = "RiaSans";

  // 홈 화면 로고
  static const TextStyle logo = TextStyle(
    fontFamily: 'RiaSans',
    fontWeight: FontWeight.w800,
    fontSize: 22,
    color: Color(0xff164BC6)
  );

  //수업 생성 화면 폰트
  static const TextStyle classFormTitle = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w700,
    fontSize: 28,
  ); // 제목

  static const TextStyle classFormBody1 = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ); // 본문1

  static const TextStyle classFormBody2 = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w400,
    fontSize: 16,
  ); // 본문2

  //설문 생성 페이지 폰트
  static const TextStyle pickClassTitle = TextStyle(
    fontFamily: pretendard,
    fontWeight: FontWeight.w600,
    fontSize: 24,
  ); // 본문2


}
