import 'package:flutter/material.dart';
import 'package:peerview/views/auth/login_page.dart';
import 'package:peerview/views/auth/role_page.dart';
import 'package:peerview/views/class/class_page.dart';
import 'package:peerview/views/gate.dart';
import 'package:peerview/views/home/home_page.dart';
import 'package:peerview/views/navigation.dart';
import 'package:peerview/views/survey/survey_form_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/gate': (context) => const GatePage(),
    '/login': (context) => LoginPage(),
    '/role': (context) => RolePage(),
    '/adminHome' : (context) => AdminNavigation(),
    // '/class': (context) => ClassPage(),
    '/surveyForm' : (context) => SurveyFormPage(),
  };
}
