import 'package:flutter/material.dart';
import 'package:peerview/views/auth/login_page.dart';
import 'package:peerview/views/auth/role_page.dart';
import 'package:peerview/views/class/class_page.dart';
import 'package:peerview/views/home/home_page.dart';
import 'package:peerview/views/navigation.dart';
import 'package:peerview/views/survey/survey_form_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/role': (context) => RolePage(),
    '/' : (context) => Navigation(),
    // '/class': (context) => ClassPage(),
    '/surveyForm' : (context) => SurveyFormPage(),

  };
}
