import 'package:flutter/material.dart';
import 'package:peerview/views/auth/login_page.dart';
import 'package:peerview/views/auth/role_page.dart';
import 'package:peerview/views/home/home_page.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/login': (context) => LoginPage(),
    '/' : (context) => HomePage(title: 'Peerview'),
    '/role': (context) => RolePage(),

  };
}
